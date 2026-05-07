{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "ForgeCode" }}

## Setup forge completions

forge_bin=$(command -v forge >/dev/null)
if [ -z "$forge_bin" ] && command -v mise >/dev/null; then
  forge_dir=$(mise where "github:tailcallhq/forgecode")
  if [ -d "$forge_dir" ]; then
    forge_bin="$forge_dir/forge"
  fi
fi

{{- if hasKey . "plugin" | ternary (get . "plugin") true }}
eval "$("$forge_bin" zsh plugin)"
{{- end }}
{{- if hasKey . "theme" | ternary (get . "theme") true }}
eval "$("$forge_bin" zsh theme)"
{{- end }}
unset forge_dir forge_bin

{{ end -}}
