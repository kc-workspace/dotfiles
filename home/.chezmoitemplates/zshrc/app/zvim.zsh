{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - vim-mode" }}

## Setup vim mode
## https://github.com/jeffreytse/zsh-vi-mode
{{- if hasKey . "lazy" | ternary (get . "lazy") false }}
zinit ice wait lucid
{{- end }}
zinit {{ get . "act" | default "light" }} jeffreytse/zsh-vi-mode

{{ end -}}
