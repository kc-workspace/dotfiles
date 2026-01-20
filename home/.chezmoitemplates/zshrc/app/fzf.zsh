{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - fzf" }}

## Setup fzf - fuzzy finder (required by lazyvim and zoxide)
## https://github.com/junegunn/fzf
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait lucid{{- end }} as"command" \
  from"gh-r" bpick"fzf-*.tar.gz" pick="fzf" \
  atclone"./fzf --zsh > _fzf" atpull"%atclone"
zinit {{ get . "act" | default "light" }} junegunn/fzf

{{ end -}}
