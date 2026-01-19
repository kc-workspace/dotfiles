{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h2" "Zsh binding" }}

# FIXME: this doesn't works
## Needed when zsh-vi-mode is enabled
# function zvm_after_lazy_keybindings() {
#   bindkey -M viins '^[[1;9C' vi-forward-word-end
#   bindkey -M viins '^[[C' vi-forward-word
# }

# bindkey -M viins '^[[1;9C' vi-forward-word-end
# bindkey -M viins '^[[C' vi-forward-word
{{ end -}}
