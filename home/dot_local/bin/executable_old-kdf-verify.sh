#!/usr/bin/env bash

set -e

printf "\n==============================================
Verify %s
==============================================\n" "commands"
printf 'curl: ' && command -v curl
printf 'git: ' && command -v git
printf 'unzip: ' && command -v unzip
printf 'mise: ' && command -v mise
printf 'chezmoi: ' && command -v chezmoi
printf 'op: ' && command -v op
printf 'gpg: ' && command -v gpg
printf 'zsh: ' && command -v zsh

printf "\n==============================================
Verify %s
==============================================\n" "chezmoi"
temp="$(mktemp)"
# shellcheck disable=SC2086
chezmoi status --no-pager --no-tty $CHEZMOI_ARGUMENTS | tee "$temp"
if [ -s "$temp" ]; then
  printf 'chezmoi should be on the clean state' >&2
  exit 2
fi

printf "\n==============================================
Verify %s
==============================================\n" "zsh"
printf 'zsh version: '
zsh -c 'echo "${ZSH_VERSION:?}"'

printf "\n==============================================
Verify %s
==============================================\n" "mise tools"
mise list

printf "\n==============================================
Verify %s
==============================================\n" "mise health"
mise doctor
