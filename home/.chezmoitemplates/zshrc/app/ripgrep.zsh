{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - ripgrep" }}

## Setup ripgrep - extends grep command
## https://github.com/BurntSushi/ripgrep
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait lucid{{- end }} as"command" \
  from"gh-r" bpick"ripgrep-*.tar.gz" pick"ripgrep-*/rg" \
  atclone"ripgrep-*/rg --generate complete-zsh > _rg" atpull"%atclone"
zinit {{ get . "act" | default "light" }} BurntSushi/ripgrep

{{ end -}}
