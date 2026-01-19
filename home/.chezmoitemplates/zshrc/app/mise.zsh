{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Mise CLI" }}

## Setup mise and completions (cannot use oh-my-zsh plugin)
mise_bin="$XDG_BIN_HOME/mise"
if [ -f "$mise_bin" ]; then
  eval "$("$mise_bin" activate zsh)"
  if ! [ -f "$__ZRC_FUNC/_mise" ]; then
    "$mise_bin" completion zsh >"$__ZRC_FUNC/_mise"
  fi
fi
unset mise_bin

## Setup mise aliases
alias m="mise"
alias mr="mise task run"

{{ end -}}
