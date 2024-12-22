#!/usr/bin/env bash

set -e

echo "# Initiate chezmoi with minimal mode

On this mode, we will removed all encrypted file.
"

: "${CHEZMOI_ARGUMENTS:=}"
export KCDF_MODE=minimal

_run() {
  local mode="$1" name="$2"
  shift 2

  local stdout stderr status
  stdout="$(mktemp)"
  stderr="$(mktemp)"

  printf '$ Run "%s": ' "$name"
  if "$@" >"$stdout" 2>"$stderr"; then
    status=0
  else
    status=1
  fi

  if [ $status -eq 1 ] && [[ $mode == required ]]; then
    status=2
  fi

  case "$status" in
  0) printf 'PASSED\n' ;;
  1) printf 'FAILED (OPTIONAL)\n' ;;
  2) printf 'FAILED\n' ;;
  esac

  if [ -s "$stdout" ]; then
    printf '  - OUTPUT::STDOUT\n'
    cat "$stdout"
  fi
  if [ -s "$stderr" ]; then
    printf '  - OUTPUT::STDERR\n'
    cat "$stderr"
  fi

  echo
  rm "$stdout" "$stderr"
}

## Delete all asc file
printf '$ find %s -name "*.asc" -exec rm {} \;\n' "$CHEZMOI_HOME"
find "${CHEZMOI_HOME:?}" -name "*.asc" -exec rm {} \;

# shellcheck disable=SC2086
_run required "apply chezmoi configuration" \
  chezmoi init --apply $CHEZMOI_ARGUMENTS
# shellcheck disable=SC2086
_run optional "check chezmoi status" \
  chezmoi status $CHEZMOI_ARGUMENTS
# shellcheck disable=SC2086
_run optional "check chezmoi doctor" \
  chezmoi doctor $CHEZMOI_ARGUMENTS
# shellcheck disable=SC2086
_run optional "check chezmoi path" \
  chezmoi managed --path-style absolute --tree $CHEZMOI_ARGUMENTS

temp="$(mktemp)"
# shellcheck disable=SC2086
chezmoi status $CHEZMOI_ARGUMENTS | tee "$temp"
if test -s "$temp"; then
  exit 1
fi
