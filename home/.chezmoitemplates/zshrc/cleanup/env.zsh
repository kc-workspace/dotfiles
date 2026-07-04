{{- $context := .context -}}
{{- if not (get . "disabled") }}
{{- includeTemplate "zshrc/helpers/h3" "Clean environments" }}

## For local site-functions path
unset __ZRC_FUNC

{{ end -}}
