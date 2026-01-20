{{- $keys := dict -}}
{{- $_ := set $keys "^[[C" "vi-forward-char" -}}{{/* arrow-right */}}
{{- $_ := set $keys "^[[D" "vi-backward-char" -}}{{/* arrow-left */}}
{{- $_ := set $keys "^[[1;9C" "vi-forward-blank-word" -}}{{/* cmd+right */}}
{{- $_ := set $keys "^[[1;2C" "vi-forward-word" -}}{{/* shift+right */}}
{{- $_ := set $keys "^[[1;9D" "vi-backward-blank-word" -}}{{/* cmd+left */}}
{{- $_ := set $keys "^[[1;2D" "vi-backward-word" -}}{{/* shift+left */}}

{{- $indent := get . "indent" | default 0 -}}
{{- $keymap := get . "keymap" | default "" -}}
{{- if not (get . "disabled") }}
{{- if not (get . "hideHeader") }}{{ template "zshrc/helpers/h2" "Zsh binding" }}{{ end }}

{{- range $key, $action := $keys }}
{{ "  " | repeat $indent -}}
bindkey {{- if $keymap }} -M {{ $keymap }}{{ end }} {{ $key | squote }} {{ $action }}

{{- end }}

{{ end -}}
