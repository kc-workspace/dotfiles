{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - Syntax highlight" }}

## Setup command syntax highlighting
## Must be on the end of zinit script
## https://github.com/zsh-users/zsh-syntax-highlighting
{{- if hasKey . "lazy" | ternary (get . "lazy") false }}
zinit ice wait lucid
{{- end }}
zinit {{ get . "act" | default "light" }} zsh-users/zsh-syntax-highlighting

{{ end -}}
