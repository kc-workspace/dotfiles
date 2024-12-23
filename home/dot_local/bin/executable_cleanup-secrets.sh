#!/usr/bin/env bash

set -e

export GPG_FINGERPRINT=""

setup_1password() {
  : "${OP_SERVICE_ACCOUNT_TOKEN:=${OP_TOKEN:-${TOKEN}}}"

  export OP_ACCOUNT="my.1password.com"
  export OP_SERVICE_ACCOUNT_TOKEN

  local gpg_key_op_item="fp3xx4qmu7ocxr2r546q6deocu"
  local gpg_key_op_vault="64yg7lvccdzebup52w2nmzoady"

  if [ -z "$OP_SERVICE_ACCOUNT_TOKEN" ]; then
    echo -n 'Enter 1Password service account token: '
    read -rs OP_SERVICE_ACCOUNT_TOKEN
    echo
  fi

  ## Check is signed in
  op whoami || return $?

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
  rm "$gpg_key_path" "$gpg_finger_path"

  unset OP_ACCOUNT OP_SERVICE_ACCOUNT_TOKEN
}

setup_chezmoi() {
  chezmoi init --apply --no-pager --no-tty
}

cleanup() {
  if [ -n "$GPG_FINGERPRINT" ]; then
    gpg --batch --yes --delete-secret-and-public-key "$GPG_FINGERPRINT"
  fi
  unset GPG_FINGERPRINT
}

setup_1password
setup_chezmoi

cleanup
