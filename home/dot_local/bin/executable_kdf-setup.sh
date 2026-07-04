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
  _mise_setup
  _chezmoi_setup
  _zinit_setup
  _nvim_setup
}

_mise_setup() {
  progress "Set up mise tools"
  mise_activate bash
  mise_install
  progress_end
}

_chezmoi_setup() {
  progress "Set up chezmoi config"
  _chezmoi_init \
    --apply \
    --promptDefaults --promptBool "Enable 1Password=true,Enable age=true"
  progress_end
}

_zinit_setup() {
  progress "Set up zinit plugins"
  zsh -ic -- "@zinit-scheduler burst"
  progress_end
}

_nvim_setup() {
  progress "Set up Neovim config"
  nvim_install
  progress_end
}

kdf-main
