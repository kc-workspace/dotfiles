{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h2" "Zsh environment" }}

## XDG Base Directory
## https://gist.github.com/roalcantara/107ba66dfa3b9d023ac9329e639bc58c
## https://specifications.freedesktop.org/basedir/latest/
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_CACHE_HOME="$HOME/.cache"

export __ZRC_FUNC="$XDG_DATA_HOME/completions"

{{ end -}}
