{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h2" "Zsh title" }}

__ztitle_mapping=(
  "[PS]:$HOME/Documents/Personal"
  "[ST]:$HOME/Documents/Works/Smartertravel"
  "[ST]:$HOME/Documents/Works/Smartertravel.old"
  "[RX]:$HOME/Documents/Works/Rx"
  "[TMP]:/tmp"
  "[TMP]:${TMPDIR%/}"
)

function __ztitle_set() {
  local title="$1"
  echo -ne "\033]0;$title\007"
}

function __ztitle() {
  local raw prefix prefix_path
  for raw in "${__ztitle_mapping[@]}"; do
    prefix="${raw%:*}"
    prefix_path="${raw##*:}"
    if [[ $PWD =~ ^"$prefix_path"$ ]]; then
      __ztitle_set "$prefix ~"
      return 0
    fi
    if [[ $PWD =~ ^"$prefix_path/" ]]; then
      __ztitle_set "$prefix ${PWD#$prefix_path/}"
      return 0
    fi
  done

  if [[ $PWD == $HOME ]]; then
    __ztitle_set "~"
  elif [[ $PWD =~ ^$HOME ]]; then
    __ztitle_set "~/${PWD#$HOME/}"
  else
    __ztitle_set "$PWD"
  fi
}

precmd_functions+=(__ztitle)

{{ end -}}
