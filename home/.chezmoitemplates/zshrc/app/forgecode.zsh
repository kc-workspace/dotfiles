{{- if not (get . "disabled") }}
{{- includeTemplate "zshrc/helpers/h3" "ForgeCode" }}

export FORGE_CONFIG="$HOME/.config/forgecode"

{{ end -}}
