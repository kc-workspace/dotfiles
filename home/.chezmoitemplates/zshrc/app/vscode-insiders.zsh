{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Vscode insiders" }}

alias code="code-insiders"

{{ end -}}
