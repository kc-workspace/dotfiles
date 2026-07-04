#!/usr/bin/env bash

set -euo pipefail
# set -x ## DEBUG

KDF_OLDPWD="$PWD"
KDF_CMD="$(command -v "$0")"
cd "$(dirname "$KDF_CMD")"
KDF_ROOT="$PWD"

export KDF_OLDPWD KDF_ROOT KDF_CMD

# shellcheck disable=SC1091
source "$KDF_ROOT/.kdf-utils/index.sh"

_main() {
  _chezmoi_cleanup
}

_chezmoi_cleanup() {
  progress "clean up chezmoi"
  chezmoi purge --binary --force
  progress_end
}

kdf-main
