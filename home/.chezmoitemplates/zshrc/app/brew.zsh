{{- if not (get . "disabled") }}
{{- $context := .context -}}
{{- includeTemplate "zshrc/helpers/h3" "HomeBrew" }}

## Setup brew alias and completions
{{ includeTemplate "shell/helpers/brewSetup" (dict
	"context" $context
	"env" false
) }}
[ -f "$brew_cmd" ] && eval "$("$brew_cmd" shellenv)"
{{ includeTemplate "shell/helpers/brewCleanup" (dict
	"context" $context
) }}

{{ end -}}
