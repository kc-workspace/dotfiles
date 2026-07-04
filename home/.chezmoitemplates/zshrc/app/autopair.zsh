{{- $context := .context -}}
{{- if not (get . "disabled") }}
{{- includeTemplate "zshrc/helpers/h3" "Zinit Plugins - autopair" }}

## Setup autopair characters
## https://github.com/hlissner/zsh-autopair
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait"2" lucid{{- end }}
zinit {{ get . "act" | default "light" }} hlissner/zsh-autopair

{{ end -}}
