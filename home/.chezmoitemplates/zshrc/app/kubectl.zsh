{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Kubectl" }}

## Setup kubectl completions and aliases
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait"2" lucid{{- end }}
zinit snippet OMZP::kubectl

{{ end -}}
