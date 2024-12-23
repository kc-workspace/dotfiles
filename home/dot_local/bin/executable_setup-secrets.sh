#!/usr/bin/env bash

## export variables:
##   - OP_ACCOUNT
##   - OP_SERVICE_ACCOUNT_TOKEN
##   - GITHUB_TOKEN
##   - GPG_FINGERPRINT

export OP_ACCOUNT="my.1password.com"
export OP_VAULT="${OP_VAULT:-64yg7lvccdzebup52w2nmzoady}"

setup_1password() {
  export OP_SERVICE_ACCOUNT_TOKEN
  if [ -z "$OP_SERVICE_ACCOUNT_TOKEN" ]; then
    if [ -n "$CI" ]; then
      printf 'Missing 1Password token, please set OP_SERVICE_ACCOUNT_TOKEN environment variable' >&2
      return 2
    elif [ -n "$DOCKER" ]; then
      echo -n 'Enter 1Password service account token: '
      read -rs OP_SERVICE_ACCOUNT_TOKEN
      echo
    else
      op signin
    fi
  fi

  ## Check is signed in
  if ! op whoami; then
    return 5
  fi
}

setup_github() {
  export GITHUB_TOKEN

  if [ -z "$GITHUB_TOKEN" ]; then
    export TOKEN="op://$OP_VAULT/GITHUB_TOKEN/password"
    op run --no-masking -- printenv TOKEN | gh auth login --with-token
    unset TOKEN

    GITHUB_TOKEN="$(gh auth token)"
  fi

  ## Check is signed in
  if ! gh auth status --active; then
    return 5
  fi
}

setup_gpg() {
  if [ -z "$GPG_FINGERPRINT" ]; then
    local gpg_key_op_item="fp3xx4qmu7ocxr2r546q6deocu"

    local gpg_key_path gpg_finger_path
    gpg_key_path="$(mktemp)"
    gpg_finger_path="$(mktemp)"

    op item get "$gpg_key_op_item" \
      --vault "$OP_VAULT" \
      --field label=Fingerprint | tee "$gpg_finger_path"
    op document get "$gpg_key_op_item" \
      --vault "$OP_VAULT" \
      --out-file "$gpg_key_path" --force
    gpg --quiet --import "$gpg_key_path"

    GPG_FINGERPRINT="$(cat "$gpg_finger_path")"
    export GPG_FINGERPRINT

    rm "$gpg_key_path" "$gpg_finger_path"
  fi

  if ! gpg --list-secret-keys "$GPG_FINGERPRINT"; then
    return 5
  fi
}

printf "\n==============================================
Set up %s
==============================================\n" "1Password"
setup_1password

printf "\n==============================================
Set up %s
==============================================\n" "GitHub Authentication"
setup_github

printf "\n==============================================
Set up %s
==============================================\n" "GPG key"
setup_gpg
