#!/usr/bin/env bash
# shellcheck disable=SC1091

set -euo pipefail

: "${KDF_ROOT:?Missing root env}"
: "${KDF_CMD:?Missing command env}"
: "${KDF_OLDPWD:?Missing previous pwd env}"

export KDF_UTILS="$KDF_ROOT/.kdf-utils"

source "$KDF_UTILS/logger.sh"
source "$KDF_UTILS/mise.sh"
source "$KDF_UTILS/nvim.sh"

kdf-main() {
  local cb="${1:-_main}"

  _kdf-setup
  _kdf-run "$cb"
  _kdf-cleanup
}

_kdf-setup() {
  export NONINTERACTIVE=1
  export DO_NOT_TRACK=1
}

_kdf-run() {
  local cb="$1"
  "$cb"
}

_kdf-cleanup() {
  unset NONINTERACTIVE DO_NOT_TRACK

  cd "$KDF_OLDPWD"
  unset KDF_OLDPWD
  unset KDF_ROOT KDF_CMD KDF_UTILS
}
