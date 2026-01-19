{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - Lazygit" }}

## Setup lazygit - git with lazy (required by lazyvim)
## https://github.com/jesseduffield/lazygit
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") false }} wait lucid{{- end }} as"command" \
  from"gh-r" pick="lazygit"
zinit {{ get . "act" | default "light" }} jesseduffield/lazygit

{{ end -}}
