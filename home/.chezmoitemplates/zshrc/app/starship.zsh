{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - Starship theme" }}

## Setup starship prompt
## https://starship.rs
zinit ice as"command" from"gh-r" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" src"init.zsh"
zinit {{ get . "act" | default "light" }} starship/starship

{{ end -}}
