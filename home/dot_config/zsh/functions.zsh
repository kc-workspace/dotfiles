__fn_title_mapping=(
  "[PS]:$HOME/Documents/Personal"
  "[ST]:$HOME/Documents/Works/Smartertravel"
  "[ST]:$HOME/Documents/Works/Smartertravel.old"
  "[RX]:$HOME/Documents/Works/Rx"
  "[TMP]:/tmp"
  "[TMP]:${TMPDIR%/}"
)

function __fn_title() {
  local title="$1"
  echo -ne "\033]0;$title\007"
}

function __fn_set_title(){
  local raw prefix prefix_path
  for raw in "${__fn_title_mapping[@]}"; do
    prefix="${raw%:*}"
    prefix_path="${raw##*:}"
    if [[ $PWD =~ ^"$prefix_path"$ ]]; then
      __fn_title "$prefix ~"
      return 0
    fi
    if [[ $PWD =~ ^"$prefix_path/" ]]; then
      __fn_title "$prefix ${PWD#$prefix_path/}"
      return 0
    fi
  done

  if [[ $PWD == $HOME ]]; then
    __fn_title "~"
  elif [[ $PWD =~ ^$HOME ]]; then
    __fn_title "~/${PWD#$HOME/}"
  else
    __fn_title "$PWD"
  fi
}

precmd_functions+=(__fn_set_title)

