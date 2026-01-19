{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - yazi" }}

## Setup yazi (file manager)
## https://github.com/sxyazi/yazi
# shellcheck disable=SC2016
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait"1" lucid{{- end }} as"command" \
  from"gh-r" bpick"yazi-*.zip" pick"yazi-*/yazi" \
  atload'
y() {
  local tmp cwd
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}'
zinit {{ get . "act" | default "light" }} sxyazi/yazi

{{ end -}}
