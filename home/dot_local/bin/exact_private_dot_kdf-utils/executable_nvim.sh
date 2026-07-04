#!/usr/bin/env bash
# shellcheck disable=SC1091

set -euo pipefail

nvim_install() {
  if command -v nvim >/dev/null 2>&1; then
    nvim --headless '+Lazy! sync' +qa
    nvim --headless '+TSInstall all' +qa
  fi
}
