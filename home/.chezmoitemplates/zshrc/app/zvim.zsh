{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - vim-mode" }}

function zvm_config() {
  ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_LAZY_KEYBINDINGS={{ hasKey . "lazyBind" | ternary (get . "lazyBind") true }}
}

## Setup vim mode
## https://github.com/jeffreytse/zsh-vi-mode
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") false }} wait lucid{{- end }} atinit"
export ZVM_VI_ESCAPE_BINDKEY=jk" atload"
{{- template "zshrc/zsh/bind.zsh" (dict "hideHeader" true "keymap" "viins") -}}"
zinit {{ get . "act" | default "light" }} jeffreytse/zsh-vi-mode

{{ end -}}
