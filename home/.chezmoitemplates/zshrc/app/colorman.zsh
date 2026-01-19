{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - colored man-pages" }}

## Setup colored-man-pages
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait"2" lucid{{- end }}
zinit snippet OMZP::colored-man-pages

{{ end -}}
