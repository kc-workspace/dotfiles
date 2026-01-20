{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - Autosuggest" }}

## Setup autosuggestions
## https://github.com/zsh-users/zsh-autosuggestions

zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait lucid{{- end }} atload"
## https://github.com/zsh-users/zsh-autosuggestions/blob/85919cd1ffa7d2d5412f6d3fe437ebdbeeec4fc5/src/config.zsh#L26-L41
ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(
  ## zsh-users/zsh-history-substring-search widget
  history-substring-search-up
  history-substring-search-down

  ## Zsh widget
  history-search-forward
  history-beginning-search-forward
  history-search-backward
  history-beginning-search-backward
  expand-or-complete
)"
zinit {{ get . "act" | default "light" }} zsh-users/zsh-autosuggestions

{{ end -}}
