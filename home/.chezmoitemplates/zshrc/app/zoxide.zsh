{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - Zoxide" }}

## Setup zoxide - cd alternative command
## https://github.com/ajeetdsouza/zoxide
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait lucid{{- end }} as"command" \
  from"gh-r" bpick"zoxide-*.tar.gz" src"init.zsh" \
  atclone"./zoxide init zsh --cmd d > init.zsh" atpull"%atclone"
zinit {{ get . "act" | default "light" }} ajeetdsouza/zoxide

{{ end -}}
