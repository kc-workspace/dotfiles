{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - vim-mode" }}

function zvm_config() {
  ## FIXME: Not working
  ZVM_VI_ESCAPE_BINDKEY=jj
  ZVM_KEYTIMEOUT=1
  ZVM_ESCAPE_KEYTIMEOUT=0.1
  ZVM_LAZY_KEYBINDINGS={{ hasKey . "lazy" | ternary (get . "lazy") true }}
}

## Setup vim mode
## https://github.com/jeffreytse/zsh-vi-mode
zinit {{ get . "act" | default "light" }} jeffreytse/zsh-vi-mode

{{ end -}}
