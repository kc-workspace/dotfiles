#!/usr/bin/env bash

set -e

pushd "$(dirname "$0")"

# shellcheck disable=SC1091
source "$PWD/setup-secrets.sh"

printf "\n==============================================
Initiate and Apply %s
==============================================\n" "chezmoi config"
# shellcheck disable=SC2086
chezmoi init --apply --no-pager --no-tty $CHEZMOI_ARGUMENTS

# shellcheck disable=SC1091
source "$PWD/cleanup-secrets.sh"

set +x
popd
