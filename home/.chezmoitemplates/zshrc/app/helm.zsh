{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Helm" }}

## Setup helm completions and aliases
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait"2" lucid{{- end }}
zinit snippet OMZP::helm

{{ end -}}
