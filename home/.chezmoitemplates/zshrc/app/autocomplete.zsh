{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - Autocomplete" }}

## Setup autocompletions
## https://github.com/marlonrichert/zsh-autocomplete
zinit ice blockf {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait lucid{{ end }} atload"
bindkey -M menuselect '^I' menu-complete
"
zinit {{ get . "act" | default "light" }} marlonrichert/zsh-autocomplete

{{ end -}}
