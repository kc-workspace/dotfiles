{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - fd" }}

## Setup fd - find alternative command
## https://github.com/sharkdp/fd
zinit ice as"command" \
  from"gh-r" bpick"fd-*.tar.gz" pick"fd-*/fd"
zinit {{ get . "act" | default "light" }} sharkdp/fd

## Setup find alternative alias
alias f="fd"

{{ end -}}
