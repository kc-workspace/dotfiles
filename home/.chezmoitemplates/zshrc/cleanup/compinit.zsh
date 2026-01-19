{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Final compinit" }}

## Run compinit and replay
zicompinit && zicdreplay

{{ end -}}
