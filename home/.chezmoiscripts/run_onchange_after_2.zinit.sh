#!/usr/bin/env zsh

## .zshrc hash    : {{ include "dot_zshrc" | sha256sum }}
## .zprofile hash : {{ include "dot_zprofile" | sha256sum }}

export ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"

source ${ZINIT_HOME:?}/zinit.zsh
zinit self-update
