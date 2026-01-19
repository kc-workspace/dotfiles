{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Zinit Plugins - tree-sitter" }}

## Setup tree-sitter-cli - use tree-sitter grammars from cli (required by lazyvim)
## https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait lucid{{- end }} as"command" \
  from"gh-r" bpick"tree-sitter-*.gz" mv"tree-sitter-* -> tree-sitter" pick"tree-sitter" \
  atclone"./tree-sitter complete --shell zsh > _tree-sitter" atpull"%atclone"
zinit {{ get . "act" | default "light" }} tree-sitter/tree-sitter

{{ end -}}
