{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - wd" }}

## Setup wd cli
## https://github.com/mfaerevaag/wd
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait lucid{{- end }} as"command" pick"wd.sh" src"wd.plugin.zsh"
zinit {{ get . "act" | default "light" }} mfaerevaag/wd

{{ end -}}
