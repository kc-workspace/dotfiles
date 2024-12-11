#!/usr/bin/env bash

set -e

echo "# Initiate chezmoi with minimal mode

On this mode, we will removed all encrypted file.
"

set -x

## Delete all asc file
find "${CHEZMOI_HOME:?}" -name "*.asc" -exec rm {} \;
## Apply chezmoi configuration
# shellcheck disable=SC2086
chezmoi init $CHEZMOI_ARGUMENTS
