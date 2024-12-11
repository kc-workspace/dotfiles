#!/usr/bin/env bash

set -e

if [ $# -gt 0 ]; then
  "$@"
elif [[ $KCDF_MODE == full ]]; then
  export OP_ACCOUNT="my.1password.com"
  export OP_SERVICE_ACCOUNT_TOKEN

  : "${OP_SERVICE_ACCOUNT_TOKEN:=${OP_TOKEN:-${TOKEN}}}"

  ## Ask for service-account token (1password)
  if [ -z "$OP_SERVICE_ACCOUNT_TOKEN" ]; then
    echo -n 'Enter 1Password service account token: '
    read -rs OP_SERVICE_ACCOUNT_TOKEN
    echo
  fi

  ## Download gpg key from 1password if input valid token
  if op whoami; then
    ## To view items and ids: `op document list`
    GPG_KEY_OP_ITEM="yczksozoghyhxlqyecja4zzqm4"
    GPG_KEY_OP_VAULT="64yg7lvccdzebup52w2nmzoady"
    GPG_PATH="/tmp/gpg.asc"
    GPG_FINGERPRINT="$(op item get \
      "$GPG_KEY_OP_ITEM" \
      --vault "$GPG_KEY_OP_VAULT" \
      --field label=Fingerprint)"
    ## Download gpg public & private key from 1password
    op document get \
      "$GPG_KEY_OP_ITEM" \
      --vault "$GPG_KEY_OP_VAULT" \
      --out-file "$GPG_PATH"

    gpg --quiet --import "$GPG_PATH" >/dev/null
    rm "$GPG_PATH"

    unset GPG_KEY_OP_ITEM GPG_KEY_OP_VAULT GPG_PATH
  fi

  ## Initiate && Apply chezmoi config
  "$CHEZMOI_BIN/chezmoi" init --apply

  if [ -n "$GPG_FINGERPRINT" ]; then
    gpg --batch --yes --delete-secret-and-public-key "$GPG_FINGERPRINT"
    unset GPG_FINGERPRINT
  fi
  unset OP_SERVICE_ACCOUNT_TOKEN
elif [[ $KCDF_MODE == minimal ]]; then
  ## Initiate && Apply chezmoi config
  "$CHEZMOI_BIN/chezmoi" init --apply
fi

if [ -z "$GITHUB_ACTIONS" ]; then
  exec "$SHELL"
fi