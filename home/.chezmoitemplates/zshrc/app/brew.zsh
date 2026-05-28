{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "HomeBrew" }}

## Setup brew alias and completions
{{ template "shellVars/brew.tmpl" }}
[ -f "$brew_cmd" ] && eval "$("$brew_cmd" shellenv)"
unset brew_bin brew_cmd

{{ end -}}
