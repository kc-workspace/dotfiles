#!/usr/bin/env bash

set -euo pipefail
# set -x ## DEBUG

KDF_OLDPWD="$PWD"
KDF_CMD="$(command -v "$0")"
cd "$(dirname "$KDF_CMD")"
KDF_ROOT="$PWD"

export KDF_OLDPWD KDF_ROOT KDF_CMD

# shellcheck disable=SC1091
source "$KDF_ROOT/.kdf-utils/index.sh"

_main() {
  _mise_init
  _chezmoi_init
  _zinit_init
  _nvim_init
}

_mise_init() {
  progress "Set up mise tools"
  mise_activate bash
  mise_install
  progress_end
}

_chezmoi_init() {
  progress "Set up chezmoi config"
  chezmoi init \
    --verbose \
    --promptDefaults \
    --promptBool "Enable 1Password=true,Enable age=true"
  chezmoi apply
  progress_end
}

_zinit_init() {
  progress "Set up zinit plugins"
  zsh -ic -- "@zinit-scheduler burst"
  progress_end
}

_nvim_init() {
  progress "Set up Neovim config"
  nvim_install
  progress_end
}

kdf-main
