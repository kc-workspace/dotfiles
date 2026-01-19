{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h2" "Zsh binding" }}

## Key bindings for moving char/word
bindkey '^[[1;9C' vi-forward-word
bindkey "^[[C" vi-forward-char

{{ end -}}
