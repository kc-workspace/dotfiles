#!/usr/bin/env bash

set -e

if [ -z "$GITHUB_TOKEN" ] ||
  [ -z "$OP_SERVICE_ACCOUNT_TOKEN" ] ||
  [ -z "$GPG_FINGERPRINT" ]; then
  pushd "$(dirname "$0")"
  # shellcheck disable=SC1091
  source "$PWD/setup-secrets.sh"
  popd
fi

chezmoi init --apply --no-pager --no-tty

pushd "$(dirname "$0")"
# shellcheck disable=SC1091
source "$PWD/cleanup-secrets.sh"
popd
