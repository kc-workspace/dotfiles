#!/usr/bin/env bash

set -e

export OP_ACCOUNT="my.1password.com"
export OP_SERVICE_ACCOUNT_TOKEN

: "${OP_SERVICE_ACCOUNT_TOKEN:=${OP_TOKEN:-${TOKEN}}}"

if [ -z "$OP_SERVICE_ACCOUNT_TOKEN" ] && [ ]; then
  echo -n 'Enter 1Password service account token: '
  read -rs OP_SERVICE_ACCOUNT_TOKEN
  echo
fi

## Don't exit program when cannot login to 1password
if op whoami; then
  ## To view items and ids: `op document list`
  GPG_KEY_OP_ITEM="yczksozoghyhxlqyecja4zzqm4"
  GPG_KEY_OP_VAULT="64yg7lvccdzebup52w2nmzoady"
  GPG_PATH="/tmp/gpg.asc"

  ## Download gpg public & private key from 1password
  op document get \
    "$GPG_KEY_OP_ITEM" \
    --vault "$GPG_KEY_OP_VAULT" \
    --out-file "$GPG_PATH"

  gpg --import "$GPG_PATH" >/dev/null
  rm "$GPG_PATH"

  unset GPG_KEY_OP_ITEM GPG_KEY_OP_VAULT GPG_PATH
fi

if [ $# -eq 0 ]; then
  "$CHEZMOI_BIN/chezmoi" init --apply
  unset OP_SERVICE_ACCOUNT_TOKEN

  exec "$SHELL"
else
  "$@"
fi
