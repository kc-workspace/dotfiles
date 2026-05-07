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

{{ if hasKey . "plugin" | ternary (get . "plugin") true }}
if [[ -z "$_FORGE_PLUGIN_LOADED" ]]; then
  autoload bashcompinit && bashcompinit && zicompinit
  eval "$("$forge_bin" zsh plugin)"
fi
{{- end }}
{{- if hasKey . "theme" | ternary (get . "theme") true }}
if [[ -z "$_FORGE_THEME_LOADED" ]]; then
  eval "$("$forge_bin" zsh theme)"
fi
{{- end }}
unset forge_dir forge_bin

export FORGE_CONFIG="$HOME/.config/forgecode"

{{ end -}}
