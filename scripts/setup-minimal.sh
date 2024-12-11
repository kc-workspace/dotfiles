#!/usr/bin/env bash

set -e

echo "# Initiate chezmoi with minimal mode

On this mode, all encrypted file will be removed.
Neither 1password nor gpg will automatically install on this mode.
"

## Delete all asc file
find "${CHEZMOI_HOME:?}" -name "*.asc" -exec rm {} \;
## Apply chezmoi configuration
chezmoi apply
