{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - bat" }}

## Setup bat - cat alternative command
## https://github.com/sharkdp/bat
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait lucid{{- end }} as"command" \
  from"gh-r" bpick"bat-*.tar.gz" pick"bat-*/bat" \
  mv"bat-*/autocomplete/bat.zsh -> _bat"
zinit {{ get . "act" | default "light" }} sharkdp/bat

## Setup cat alternative alias
alias p="bat"

{{ end -}}
