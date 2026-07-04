{{- $context := .context -}}
{{- if not (get . "disabled") }}
{{- includeTemplate "zshrc/helpers/h2" "Zsh alias" }}

## generic aliases
alias c="clear"
alias e="exit"

{{ end -}}
