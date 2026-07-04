#!/usr/bin/env bash
# shellcheck disable=SC1091

set -euo pipefail

_brew_activate() {
  local shell_name="${1:-bash}"
  local brew_bin brew_cmd
  brew_bin="${HOMEBREW_PREFIX:-}/bin"
  [ -f "$brew_bin/brew" ] || brew_bin="/opt/homebrew/bin"              ## default on macos (arm64)
  [ -f "$brew_bin/brew" ] || brew_bin="/usr/local/bin"                 ## default on macos (intel)
  [ -f "$brew_bin/brew" ] || brew_bin="/home/linuxbrew/.linuxbrew/bin" ## default on linux
  brew_cmd="$brew_bin/brew"

  if [ -f "$brew_cmd" ]; then
    eval "$("$brew_cmd" shellenv "$shell_name")"
  fi
}
