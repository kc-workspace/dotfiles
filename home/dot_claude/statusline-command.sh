#!/bin/bash
# Claude Code statusLine — rendered from the session JSON on stdin.
#
# Line 1: directory (branch*) | context used (session time) | model + mode |
#         caveman badge
#
# Permission mode and effort are left out on purpose: Claude Code already
# prints the mode under the prompt ("auto mode on (shift+tab to cycle)") and
# effort alongside it, so repeating either here only costs width.
# Line 2: 5H and 7D rate limits — bar, percent, reset time
#
# Line 2 only appears when the payload carries `rate_limits`, which is absent
# for API-key and Bedrock/Vertex sessions.

# No globbing: none of the expansions below want it, and a path or branch name
# holding a metacharacter would otherwise expand against the filesystem. The
# one place that needs a glob re-enables it around the loop.
set -f

input=$(cat)

# Rendered whenever there is no payload at all, so a broken pipe or a probe run
# still leaves something readable in the bar.
if [ -z "$input" ]; then
  printf 'Claude\n'
  exit 0
fi

# NUL-separated rather than tab-separated: tab is an IFS whitespace character,
# so `read` would collapse a run of them and shift every field after an empty
# one (fast_mode and the rate limits are routinely empty). Read with a loop
# rather than `mapfile -d`, which macOS's stock bash 3.2 does not have.
if command -v jq >/dev/null 2>&1; then
  field=()
  while IFS= read -r -d '' value; do
    field[${#field[@]}]=$value
  done < <(
    printf '%s' "$input" | jq -j '
      [ (.workspace.current_dir // .cwd // ""),
        (.model.display_name // ""),
        (.context_window.used_percentage // ""),
        (if .thinking.enabled == false then "off" else "on" end),
        (if .fast_mode then "on" else "" end),
        (.cost.total_duration_ms // ""),
        (.rate_limits.five_hour.used_percentage // ""),
        (.rate_limits.five_hour.resets_at // ""),
        (.rate_limits.seven_day.used_percentage // ""),
        (.rate_limits.seven_day.resets_at // "")
      ] | map(tostring) | join("\u0000") + "\u0000"'
  )
  dir=${field[0]}
  model=${field[1]}
  ctx_pct=${field[2]}
  thinking=${field[3]}
  fast=${field[4]}
  duration_ms=${field[5]}
  five_pct=${field[6]}
  five_at=${field[7]}
  seven_pct=${field[8]}
  seven_at=${field[9]}
fi

[ -z "$dir" ] && dir="$PWD"

# 256-color codes. Claude Code renders the whole status line dimmed, so these
# stay at full saturation rather than compensating twice.
C_MODEL=$'\033[38;5;39m'
C_DIR=$'\033[38;5;44m'
C_BRANCH=$'\033[38;5;77m'
C_SEP=$'\033[38;5;240m'
C_MUTED=$'\033[38;5;245m'
C_LABEL=$'\033[38;5;250m'
C_EMPTY=$'\033[38;5;238m'
C_GREEN=$'\033[38;5;77m'
C_ORANGE=$'\033[38;5;208m'
C_YELLOW=$'\033[38;5;220m'
C_RED=$'\033[38;5;203m'
R=$'\033[0m'

SEP="${C_SEP}│${R}"

round() { printf '%.0f' "$1" 2>/dev/null || printf '0'; }

# Green under 50%, orange under 70%, yellow under 90%, red at or above it.
# Applies to the dot bar, the percent beside it, and the context reading, so a
# number and its bar always agree.
usage_color() {
  if [ "$1" -lt 50 ]; then printf '%s' "$C_GREEN"
  elif [ "$1" -lt 70 ]; then printf '%s' "$C_ORANGE"
  elif [ "$1" -lt 90 ]; then printf '%s' "$C_YELLOW"
  else printf '%s' "$C_RED"; fi
}

# Filled cells carry the usage color; the remaining cells drop to a near-
# background grey so the bar reads as a gauge rather than a row of dots.
BAR_CELLS=10
bar() {
  local pct=$1 filled i out
  filled=$(( (pct * BAR_CELLS + 99) / 100 ))
  [ "$filled" -gt "$BAR_CELLS" ] && filled=$BAR_CELLS
  [ "$filled" -lt 0 ] && filled=0
  out="$(usage_color "$pct")"
  for ((i = 0; i < filled; i++)); do out+="▰"; done
  out+="$C_EMPTY"
  for ((i = filled; i < BAR_CELLS; i++)); do out+="▱"; done
  out+="$R"
  printf '%s' "$out"
}

# Session wall clock, from `cost.total_duration_ms`: "2h05m", "23m", "45s".
fmt_duration() {
  local ms=$1 secs
  case "$ms" in ''|*[!0-9.]*) return 1 ;; esac
  secs=$(( ${ms%%.*} / 1000 ))
  [ "$secs" -le 0 ] && return 1
  if [ "$secs" -ge 3600 ]; then
    printf '%dh%02dm' "$(( secs / 3600 ))" "$(( secs % 3600 / 60 ))"
  elif [ "$secs" -ge 60 ]; then
    printf '%dm' "$(( secs / 60 ))"
  else
    printf '%ds' "$secs"
  fi
}

# Epoch seconds to 24-hour "04:00", or "sep 14 23:00" once it crosses a day
# boundary. BSD date first (macOS), GNU date as the fallback.
fmt_reset() {
  local epoch=$1 fmt day today
  day=$(date -r "$epoch" '+%F' 2>/dev/null) || day=$(date -d "@$epoch" '+%F' 2>/dev/null) || return 1
  today=$(date '+%F')
  if [ "$day" = "$today" ]; then fmt='+%H:%M'; else fmt='+%b %-d %H:%M'; fi
  { date -r "$epoch" "$fmt" 2>/dev/null || date -d "@$epoch" "$fmt" 2>/dev/null; } \
    | tr '[:upper:]' '[:lower:]'
}

# One "5H bar pct ↻ reset" segment. Skipped entirely when the payload had no
# percentage for this window.
limit_seg() {
  local label=$1 pct_raw=$2 reset=$3 pct color seg when
  [ -z "$pct_raw" ] && return 1
  pct=$(round "$pct_raw")
  color=$(usage_color "$pct")
  seg=$(printf '%s%s%s %s %s%3s%%%s' \
    "$C_LABEL" "$label" "$R" "$(bar "$pct")" "$color" "$pct" "$R")
  if [ -n "$reset" ] && when=$(fmt_reset "$reset"); then
    seg+=" ${C_MUTED}↻ ${when}${R}"
  fi
  printf '%s' "$seg"
}

# --- line 1 ---------------------------------------------------------------

case "$dir" in
  "$HOME") base="~" ;;
  *) base=$(basename "$dir") ;;
esac

branch=""
dirty=""
if command -v git >/dev/null 2>&1 \
  && git --no-optional-locks -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git --no-optional-locks -C "$dir" branch --show-current 2>/dev/null)
  [ -n "$(git --no-optional-locks -C "$dir" status --porcelain -uno 2>/dev/null | head -n1)" ] && dirty="*"
fi

line1="${C_DIR}${base}${R}"
[ -n "$branch" ] && line1+=" ${C_BRANCH}(${branch}${C_RED}${dirty}${C_BRANCH})${R}"

elapsed=$(fmt_duration "$duration_ms") || elapsed=""

if [ -n "$ctx_pct" ]; then
  ctx=$(round "$ctx_pct")
  line1+=" ${SEP} ✍ $(usage_color "$ctx")${ctx}%${R}"
  [ -n "$elapsed" ] && line1+=" ${C_MUTED}(${elapsed})${R}"
elif [ -n "$elapsed" ]; then
  line1+=" ${SEP} ${C_MUTED}(${elapsed})${R}"
fi

# Model and the mode markers form one segment: the markers qualify the model
# rather than standing on their own.
if [ -n "$model" ]; then
  line1+=" ${SEP} ${C_MODEL}${model}${R}"
  [ "$fast" = "on" ] && line1+=" ${C_YELLOW}⏩ fast${R}"
  [ "$thinking" = "on" ] && line1+=" ${C_MUTED}● thinking${R}"
fi

# The caveman plugin ships its own badge script, which prints nothing when the
# mode flag is absent. Its cache path carries a version hash that changes on
# plugin update, so resolve it by glob and take the newest match.
caveman_script=""
if [ -n "$CAVEMAN_STATUSLINE" ] && [ -f "$CAVEMAN_STATUSLINE" ]; then
  caveman_script="$CAVEMAN_STATUSLINE"
else
  set +f
  for candidate in "${CLAUDE_CONFIG_DIR:-$HOME/.claude}"/plugins/cache/caveman/caveman/*/src/hooks/caveman-statusline.sh; do
    [ -f "$candidate" ] && [ "$candidate" -nt "${caveman_script:-/nonexistent}" ] && caveman_script="$candidate"
  done
  set -f
fi
if [ -n "$caveman_script" ]; then
  badge=$(bash "$caveman_script" </dev/null 2>/dev/null)
  [ -n "$badge" ] && line1+=" ${SEP} ${badge}"
fi

printf '%s\n' "$line1"

# --- line 2 ---------------------------------------------------------------

line2=""
seg=$(limit_seg 5H "$five_pct" "$five_at") && line2="$seg"
if seg=$(limit_seg 7D "$seven_pct" "$seven_at"); then
  [ -n "$line2" ] && line2+=" ${SEP} "
  line2+="$seg"
fi
[ -n "$line2" ] && printf '%s\n' "$line2"

exit 0
