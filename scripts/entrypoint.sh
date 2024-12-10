#!/usr/bin/env bash

gpg --import private.key
"$CHEZMOI_BIN/chezmoi" init --apply

exec "$SHELL"
