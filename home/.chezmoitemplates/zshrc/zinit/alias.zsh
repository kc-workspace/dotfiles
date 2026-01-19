{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h2" "Zinit alias" }}

alias zis="zinit zstatus"
alias zit="zinit times"
alias zir="zinit report --all"

{{ end -}}
