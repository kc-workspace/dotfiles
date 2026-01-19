{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - history substring" }}

## Setup substring history search
## https://github.com/zsh-users/zsh-history-substring-search
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait lucid{{- end }} atinit"
export HISTORY_SUBSTRING_SEARCH_PREFIXED=true
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_TIMEOUT=3
" atload"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down"
zinit {{ get . "act" | default "light" }} zsh-users/zsh-history-substring-search

{{ end -}}
