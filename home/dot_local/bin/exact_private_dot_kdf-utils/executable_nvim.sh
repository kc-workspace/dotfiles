#!/usr/bin/env bash
# shellcheck disable=SC1091

set -euo pipefail

nvim_setup() {
  if command -v nvim >/dev/null 2>&1; then
    progress "Set up Neovim config"
    _nvim_install
    progress_end
  fi
}

_nvim_install() {
    nvim --headless '+Lazy! sync' +qa
    nvim --headless '+TSInstall all' +qa
}
