{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - ast-grep" }}

## Setup ast-grep - grep with AST support
## https://github.com/ast-grep/ast-grep
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait lucid{{- end }} as"command" \
  from"gh-r" pick="ast-grep"
zinit {{ get . "act" | default "light" }} ast-grep/ast-grep

{{ end -}}
