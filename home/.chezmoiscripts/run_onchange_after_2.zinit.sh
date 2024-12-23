#!/usr/bin/env zsh

## .zshrc hash    : {{ include "dot_zshrc" | sha256sum }}
## .zprofile hash : {{ include "dot_zprofile" | sha256sum }}

export ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
printf 'Initiate zinit from "%s"\n' "$ZINIT_HOME"

source ${ZINIT_HOME:?}/zinit.zsh
zinit self-update
