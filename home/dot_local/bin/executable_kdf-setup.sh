#!/usr/bin/env bash

set -e

## run mise path to ensure tools are available
eval "$(mise activate bash)"

pushd "$(dirname "$0")"
# shellcheck disable=SC1091
source "$PWD/kdf-setup-secrets.sh"

printf "\n==============================================
Initiate and Apply %s
==============================================\n" "chezmoi config"
# shellcheck disable=SC2086
chezmoi init --apply --no-pager --no-tty $CHEZMOI_ARGUMENTS

printf "\n==============================================
Install %s
==============================================\n" "mise tools"
mise install

# shellcheck disable=SC1091
source "$PWD/kdf-cleanup-secrets.sh"
popd
