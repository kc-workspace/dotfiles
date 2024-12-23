#!/usr/bin/env bash

set -e

## run mise path to ensure tools are available
eval "$(mise activate bash)"

## Verify commands
printf 'mise: ' && command -v mise
printf 'chezmoi: ' && command -v chezmoi
printf 'zsh: ' && command -v zsh

## Verify chezmoi
temp="$(mktemp)"
# shellcheck disable=SC2086
chezmoi status --no-pager --no-tty $CHEZMOI_ARGUMENTS | tee "$temp"
if ! [ -s "$temp" ]; then
  printf 'chezmoi should be on the clean state' >&2
  exit 2
fi

## Verify zsh version
printf 'zsh version: '
zsh -c 'echo "${ZSH_VERSION:?}"'

## Verify 'lsd' command
printf 'list directory: '
zsh -c 'lsd $HOME'

## Verify mise command
mise doctor
