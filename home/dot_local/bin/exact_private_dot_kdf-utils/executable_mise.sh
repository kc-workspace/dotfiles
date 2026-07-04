#!/usr/bin/env bash
# shellcheck disable=SC1091

set -euo pipefail

mise_activate() {
  local shell_name="${1:-bash}"
  if command -v mise >/dev/null 2>&1; then
    eval "$(mise activate "$shell_name")"
  fi
}

mise_install() {
  if command -v mise >/dev/null 2>&1; then
    mise install --quiet "$@"
  fi
}
