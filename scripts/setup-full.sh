#!/usr/bin/env bash

set -e

echo "# Initiate chezmoi with full-version mode

On this mode, we will configure 1password service-account for decrypt file.
"

: "${CHEZMOI_ARGUMENTS:=--apply}"
: "${OP_SERVICE_ACCOUNT_TOKEN:=${OP_TOKEN:-${TOKEN}}}"
export OP_ACCOUNT="my.1password.com"
export OP_SERVICE_ACCOUNT_TOKEN

## To view items and ids: `op document list`
GPG_KEY_OP_ITEM="fp3xx4qmu7ocxr2r546q6deocu"
GPG_KEY_OP_VAULT="64yg7lvccdzebup52w2nmzoady"
GPG_PATH="/tmp/gpg.asc"

## Ask for service-account token (1password)
if [ -z "$OP_SERVICE_ACCOUNT_TOKEN" ]; then
  echo -n 'Enter 1Password service account token: '
  read -rs OP_SERVICE_ACCOUNT_TOKEN
  echo
fi

set -x

if op whoami; then
  GPG_FINGERPRINT="$(op item get \
    "$GPG_KEY_OP_ITEM" \
    --vault "$GPG_KEY_OP_VAULT" \
    --field label=Fingerprint)"

  op document get \
    "$GPG_KEY_OP_ITEM" \
    --vault "$GPG_KEY_OP_VAULT" \
    --out-file "$GPG_PATH" >/dev/null

  gpg --quiet --import "$GPG_PATH"
  rm "$GPG_PATH"
fi

## Apply chezmoi configuration
# shellcheck disable=SC2086
chezmoi init $CHEZMOI_ARGUMENTS

if [ -n "$GPG_FINGERPRINT" ]; then
  gpg --batch --yes --delete-secret-and-public-key "$GPG_FINGERPRINT"
fi
