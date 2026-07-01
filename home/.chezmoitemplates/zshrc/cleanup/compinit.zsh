{{- if not (get . "disabled") }}
{{- includeTemplate "zshrc/helpers/h3" "Final compinit" }}

## Run compinit and replay
zicompinit && zicdreplay

{{ end -}}
