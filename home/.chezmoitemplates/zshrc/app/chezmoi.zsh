{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "chezmoi" }}

## Setup chezmoi completions
zinit ice {{- if hasKey . "lazy" | ternary (get . "lazy") true }} wait"2" lucid{{- end }} atload"zicompinit; zicdreplay"
zinit snippet OMZP::chezmoi

# Setup chezmoi command aliases
alias cz="chezmoi"
alias cza="chezmoi add"
alias czr="chezmoi re-add"
alias cze="chezmoi edit"
alias czi="chezmoi init --apply"
alias czc="chezmoi cd"
alias czs="chezmoi status"
alias czd="chezmoi diff"

{{ end -}}
