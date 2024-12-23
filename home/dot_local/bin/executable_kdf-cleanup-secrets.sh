#!/usr/bin/env bash

set -e

cleanup_1password() {
  unset OP_ACCOUNT OP_SERVICE_ACCOUNT_TOKEN
}

cleanup_github() {
  local credential="$HOME/.config/gh/hosts.yml"
  if [ -f "$credential" ]; then
    rm -r "$credential"
  fi

  unset GITHUB_TOKEN GH_TOKEN
}

cleanup_gpg() {
  if [ -n "$GPG_FINGERPRINT" ]; then
    gpg --batch --yes --delete-secret-and-public-key "$GPG_FINGERPRINT"
  fi

  unset GPG_FINGERPRINT
}

printf "\n==============================================
Clean up %s
==============================================\n" "1Password"
cleanup_1password

printf "\n==============================================
Clean up %s
==============================================\n" "GitHub Authentication"
cleanup_github

printf "\n==============================================
Clean up %s
==============================================\n" "GPG key"
cleanup_gpg
