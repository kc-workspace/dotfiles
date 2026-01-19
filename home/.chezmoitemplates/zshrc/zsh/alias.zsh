{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h2" "Zsh alias" }}

## generic aliases
alias c="clear"
alias e="exit"

{{ end -}}
