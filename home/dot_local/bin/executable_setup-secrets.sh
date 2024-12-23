#!/usr/bin/env bash

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
  op whoami || return $?
}

setup_github() {
  export TOKEN="op://64yg7lvccdzebup52w2nmzoady/GITHUB_TOKEN/password"
  op run --no-masking -- printenv TOKEN | gh auth login --with-token
  unset TOKEN
}

setup_gpg() {
  local gpg_key_op_item="fp3xx4qmu7ocxr2r546q6deocu"
  local gpg_key_op_vault="64yg7lvccdzebup52w2nmzoady"

  return 0
}

setup_1password

setup_github
setup_gpg
