{{- $context := .context -}}
{{- if not (get . "disabled") }}
{{- if eq (get . "channel") "insiders" }}

{{- includeTemplate "zshrc/helpers/h3" (cat "Vscode Insiders" ) }}

alias code="code-insiders"

{{- else }}

{{- includeTemplate "zshrc/helpers/h3" (cat "Vscode" ) }}

{{- end }}

if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  {{- if eq (get . "channel") "insiders" }}
  source "$(code-insiders --locate-shell-integration-path zsh)"
  {{- else }}
  source "$(code --locate-shell-integration-path zsh)"
  {{- end }}
fi

{{ end -}}
