{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - lsd" }}

## Setup lsd - ls alternative command
## https://github.com/lsd-rs/lsd
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait lucid{{- end }} as"command" \
  from"gh-r" bpick"lsd-*.tar.gz" pick"lsd-*/lsd"
zinit {{ get . "act" | default "light" }} lsd-rs/lsd

## Setup ls alternative alias
alias l="lsd"
alias la="lsd --almost-all --long"

{{ end -}}
