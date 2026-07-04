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
  local exit_code=0
  _mise_activate bash

  _verify_commands || exit_code=$?

  _verify_zsh || exit_code=$?
  _verify_zinit || exit_code=$?
  _verify_nvim || exit_code=$?

  _verify_gpg || exit_code=$?
  _verify_chezmoi || exit_code=$?
  _verify_brew || exit_code=$?
  _verify_mise || exit_code=$?
  _verify_onepassword || exit_code=$?
  _verify_github || exit_code=$?

  _verify_system || exit_code=$?
  return "$exit_code"
}

_verify_commands() {
  local exit_code=0

  progress "Verify commands"
  _verify_command curl --version || exit_code=2
  _verify_command git --version || exit_code=2
  _verify_command file || exit_code=2
  _verify_command unzip || exit_code=2
  _verify_command mktemp || exit_code=2
  progress_end
  return "$exit_code"
}

_verify_zsh() {
  local exit_code=0

  progress "Verify zsh"
  _verify_command zsh --version || exit_code=3
  progress_end
  return "$exit_code"
}

_verify_zinit() {
  local exit_code=0

  progress "Verify zinit"
  MISE_QUIET=1 zsh -ic -- "zinit version" || exit_code=4
  MISE_QUIET=1 zsh -ic -- "zinit zstatus" || exit_code=4
  progress_end
  return "$exit_code"
}

_verify_nvim() {
  local exit_code=0

  progress "Verify neovim"
  if _verify_command nvim --version; then
    nvim --headless '+checkhealth' +qa 2>&1 | \
      sed 's/checkhealth/\ncheckhealth/g' || exit_code=5
    echo
  else
    exit_code=5
  fi
  progress_end
  return "$exit_code"
}

_verify_gpg() {
  local exit_code=0

  progress "Verify gpg"
  if _verify_command gpg --version; then
    echo
    info "GPG keys:\n"
    gpg --list-keys || exit_code=6
    echo
    info "GPG secret keys:\n"
    gpg --list-secret-keys || exit_code=6
  else
    exit_code=6
  fi
  progress_end
  return "$exit_code"
}

_verify_chezmoi() {
  local exit_code=0 tmp
  tmp="$(mktemp)"

  progress "Verify chezmoi"
  if _verify_command chezmoi --version; then
    _chezmoi status --force > "$tmp"
    echo
    if [ -s "$tmp" ]; then
      error 'Error: chezmoi is NOT on the clean state\n' &&
        cat "$tmp" &&
        exit_code=7
    else
      info 'chezmoi is on the clean state\n'
    fi
  else
    exit_code=7
  fi
  rm "$tmp"
  progress_end
  return "$exit_code"
}

_verify_brew() {
  local exit_code=0

  progress "Verify homebrew"
  # _brew_activate
  if _verify_command brew --version; then
    echo
    info "Brew doctor:\n"
    brew doctor || :
    echo
    info "Brew configuration:\n"
    brew config || exit_code=8
  else
    exit_code=8
  fi
  progress_end
  return "$exit_code"
}

_verify_mise() {
  local exit_code=0

  progress "Verify mise"
  if _verify_command mise --version; then
    echo
    info "Mise configuration:\n"
    mise doctor || exit_code=9
    echo
    info "Mise tools:\n"
    mise list || exit_code=9
  else
    exit_code=9
  fi
  progress_end
  return "$exit_code"
}

_verify_onepassword() {
  local exit_code=0

  progress "Verify 1password"
  if _verify_command op --version; then
    echo
    op whoami || : ## Optional, might change in the future
  else
    exit_code=10
  fi
  progress_end
  return "$exit_code"
}

_verify_github() {
  local exit_code=0

  progress "Verify github"
  if _verify_command gh --version; then
    echo
    gh auth status || : ## Optional, might change in the future
  else
    exit_code=11
  fi
  progress_end
  return "$exit_code"
}

kdf-main
