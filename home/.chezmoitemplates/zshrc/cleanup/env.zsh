{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Clean environments" }}

## For local site-functions path
unset __ZRC_FUNC

{{ end -}}
