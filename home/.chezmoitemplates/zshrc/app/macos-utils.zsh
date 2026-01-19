{{- if and (not (get . "disabled")) (eq .os "darwin") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - macos-utilities" }}

## Setup macos utilities
## https://github.com/unixorn/tumult.plugin.zsh#included-scripts
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait"2" lucid{{- end }}
zinit light unixorn/tumult.plugin.zsh

{{ end -}}
