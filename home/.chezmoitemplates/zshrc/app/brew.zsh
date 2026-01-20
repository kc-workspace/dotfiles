{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "HomeBrew" }}

## Setup brew alias and completions
{{ template "shellVars/brew.tmpl" }}
[ -f "$brew_bin" ] && eval "$("$brew_bin" shellenv)"
unset brew_bin

{{ end -}}
