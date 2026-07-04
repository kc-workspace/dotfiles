#!/usr/bin/env bash
# shellcheck disable=SC1091

set -euo pipefail

mise_setup() {
  progress "Set up mise tools"
  _mise_activate bash
  _mise_install
  progress_end
}

_mise_activate() {
  local shell_name="${1:-bash}"
  MISE_QUIET=1 eval "$(mise activate "$shell_name")"
}

_mise_install() {
  mise install --quiet
}
