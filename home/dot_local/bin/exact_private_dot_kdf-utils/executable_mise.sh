#!/usr/bin/env bash
# shellcheck disable=SC1091

set -euo pipefail

mise_activate() {
  local shell_name="${1:-bash}"
  eval "$(mise activate "$shell_name")"
}

mise_install() {
  mise install --quiet "$@"
}
