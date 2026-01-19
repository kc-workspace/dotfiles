{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - Completions" }}

## Setup completions definitions
## https://github.com/zsh-users/zsh-completions
zinit ice blockf {{- if hasKey . "lazy" | ternary (get . "lazy") false }} wait lucid{{- end }}
zinit {{ get . "act" | default "light" }} zsh-users/zsh-completions

{{ end -}}
