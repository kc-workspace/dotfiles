#!/usr/bin/env bash

## export variables:
##   - OP_ACCOUNT
##   - OP_SERVICE_ACCOUNT_TOKEN
##   - GITHUB_TOKEN
##   - GPG_FINGERPRINT

set -e

export OP_ACCOUNT="my.1password.com"

setup_1password() {
  : "${OP_SERVICE_ACCOUNT_TOKEN:=${OP_TOKEN:-${TOKEN}}}"
  export OP_SERVICE_ACCOUNT_TOKEN

  if [ -z "$OP_SERVICE_ACCOUNT_TOKEN" ]; then
    echo -n 'Enter 1Password service account token: '
    read -rs OP_SERVICE_ACCOUNT_TOKEN
    echo
  fi

  ## Check is signed in
  op whoami
}

setup_github() {
  if [ -z "$GITHUB_TOKEN" ]; then
    export TOKEN="op://64yg7lvccdzebup52w2nmzoady/GITHUB_TOKEN/password"
    op run --no-masking -- printenv TOKEN | gh auth login --with-token
    unset TOKEN

    GITHUB_TOKEN="$(gh auth token)"
    export GITHUB_TOKEN
  fi

  ## Check is signed in
  gh auth status
}

setup_gpg() {
  local gpg_key_op_item="fp3xx4qmu7ocxr2r546q6deocu"
  local gpg_key_op_vault="64yg7lvccdzebup52w2nmzoady"

  local gpg_key_path gpg_finger_path
  gpg_key_path="$(mktemp)"
  gpg_finger_path="$(mktemp)"

  op item get "$gpg_key_op_item" \
    --vault "$gpg_key_op_vault" \
    --field label=Fingerprint | tee "$gpg_finger_path"
  op document get "$gpg_key_op_item" \
    --vault "$gpg_key_op_vault" \
    --out-file "$gpg_key_path" >/dev/null
  gpg --quiet --import "$gpg_key_path"

  GPG_FINGERPRINT="$(cat "$gpg_finger_path")"
  export GPG_FINGERPRINT

  rm "$gpg_key_path" "$gpg_finger_path"
}

setup_1password

setup_github
setup_gpg
