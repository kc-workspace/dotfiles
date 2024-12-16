#!/usr/bin/env bash

zsh -c '
ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
source ${ZINIT_HOME:?}/zinit.zsh &&
  zinit self-update &&
  zinit update --all --parallel --no-pager'
