{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - git" }}

## Setup git aliases
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait"2" lucid{{- end }}
zinit snippet OMZP::git

{{ end -}}
