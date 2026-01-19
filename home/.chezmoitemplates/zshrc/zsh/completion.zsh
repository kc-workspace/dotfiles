{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h2" "Zsh completions" }}

setopt MENU_COMPLETE
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zcompcache
zstyle ':completion:*' file-list all=10
zstyle ':completion:*' file-sort access
zstyle ':completion:*' glob yes
zstyle ':completion:*' substitute no
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

{{ end -}}
