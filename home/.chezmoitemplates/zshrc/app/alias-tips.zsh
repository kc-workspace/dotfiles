{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - alias-tips" }}

## Setup alias tooltip
## https://github.com/decayofmind/zsh-fast-alias-tips
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait lucid{{- end }} from"gh-r" atinit"
export ZSH_FAST_ALIAS_TIPS_PREFIX='Alias for [$(tput bold)$(tput setaf 1)'
export ZSH_FAST_ALIAS_TIPS_SUFFIX='$(tput sgr0)]'"
zinit {{ get . "act" | default "light" }} decayofmind/zsh-fast-alias-tips

{{ end -}}
