{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - atuin" }}

## Setup atuin
## https://github.com/atuinsh/atuin
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait lucid{{- end }} as"command" \
  from"gh-r" bpick"atuin-*.tar.gz" mv"atuin*/atuin -> atuin" pick"atuin" \
  atclone"./atuin init zsh --disable-up-arrow > init.zsh; ./atuin gen-completions --shell zsh > _atuin" \
  atpull"%atclone" src"init.zsh" \
  atinit"zicompinit; zicdreplay"
zinit {{ get . "act" | default "light" }} atuinsh/atuin

{{ end -}}
