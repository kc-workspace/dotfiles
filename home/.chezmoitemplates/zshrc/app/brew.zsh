{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "HomeBrew" }}

## Setup brew alias and completions
brew_bin="${HOMEBREW_PREFIX:-}/bin/brew"
[ -f "$brew_bin" ] || brew_bin="/opt/homebrew/bin/brew"              ## default on macos (arm64)
[ -f "$brew_bin" ] || brew_bin="/usr/local/bin/brew"                 ## default on macos (intel)
[ -f "$brew_bin" ] || brew_bin="/home/linuxbrew/.linuxbrew/bin/brew" ## default on linux
[ -f "$brew_bin" ] && eval "$("$brew_bin" shellenv)"
unset brew_bin

{{ end -}}
