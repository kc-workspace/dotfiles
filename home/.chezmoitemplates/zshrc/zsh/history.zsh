{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h2" "Zsh history" }}

setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE="$HOME/.zsh_history"

{{ end -}}
