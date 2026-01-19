{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h2" "Zsh PATH" }}

## Setup XDG bin
[ -d "$XDG_BIN_HOME" ]  || mkdir -p "$XDG_BIN_HOME"
PATH="$XDG_BIN_HOME:$PATH"

## Setup ZRC completions
[ -d "$__ZRC_FUNC" ] || mkdir -p "$__ZRC_FUNC"
fpath+="$__ZRC_FUNC"

{{ end -}}
