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
  _verify_system
  _verify_commands
  _verify_chezmoi || exit_code=$?
  _verify_zsh || exit_code=$?
  _verify_mise || exit_code=$?

  return "$exit_code"
}

_verify_system() {
  if command -v mise >/dev/null 2>&1; then
    progress "Verify system"
    mise exec fastfetch -- fastfetch \
      --logo none
    progress_end
  fi
}

_verify_commands() {
  local exit_code=0
  progress "Verify commands"
  __verify_command "curl" || exit_code=$?
  __verify_command "git" || exit_code=$?
  __verify_command "file" || exit_code=$?
  __verify_command "unzip" || exit_code=$?
  __verify_command "mise" || exit_code=$?
  __verify_command "chezmoi" || exit_code=$?
  __verify_command "op" || exit_code=$?
  __verify_command "gpg" || exit_code=$?
  __verify_command "zsh" || exit_code=$?
  __verify_command "brew"
  progress_end

  return "$exit_code"
}
__verify_command() {
  local cmd="$1" cmd_path=""
  printf '%10s : ' "$cmd"

  cmd_path="$(command -v "$cmd" || true)"
  if [ -n "$cmd_path" ]; then
    echo "$cmd_path"
  else
    echo "<Not found>"
    return 2
  fi
}

_verify_chezmoi() {
  local tmp exit_code=0
  tmp="$(mktemp)"

  progress "Verify chezmoi status"
  chezmoi status --force | tee "$tmp"
  if [ -s "$tmp" ]; then
    echo
    error 'chezmoi should be on the clean state\n'
    exit_code=3
  else
    info 'chezmoi is on the clean state\n'
  fi

  progress_end
  return "$exit_code"
}

_verify_zsh() {
  progress "Verify zsh"
  info "Zsh Version: %s"
  zsh -c 'echo "${ZSH_VERSION:?}"'
  progress_end
}

_verify_mise() {
  progress "Verify mise"
  info "Mise doctor:\n"
  mise doctor

  info "Mise tools:\n"
  mise list
  progress_end
}

kdf-main
