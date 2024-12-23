#!/usr/bin/env bash

set -e

## run mise path to ensure tools are available
eval "$(mise activate bash)"

printf "\n==============================================
Verify %s
==============================================\n" "commands"
printf 'mise: ' && command -v mise
printf 'chezmoi: ' && command -v chezmoi
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
