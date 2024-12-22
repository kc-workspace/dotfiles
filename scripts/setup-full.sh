#!/usr/bin/env bash

set -e

echo "# Initiate chezmoi with full-version mode

On this mode, we will configure 1password service-account for decrypt file.
"

: "${CHEZMOI_ARGUMENTS:=}"
: "${OP_SERVICE_ACCOUNT_TOKEN:=${OP_TOKEN:-${TOKEN}}}"
export OP_ACCOUNT="my.1password.com"
export OP_SERVICE_ACCOUNT_TOKEN
export KCDF_MODE=full

## To view items and ids: `op document list`
GPG_KEY_OP_ITEM="fp3xx4qmu7ocxr2r546q6deocu"
GPG_KEY_OP_VAULT="64yg7lvccdzebup52w2nmzoady"
GPG_PATH="/tmp/gpg.asc"

## Ask for service-account token (1password)
if [ -z "$OP_SERVICE_ACCOUNT_TOKEN" ]; then
  echo -n 'Enter 1Password service account token: '
  read -rs OP_SERVICE_ACCOUNT_TOKEN
  echo
fi

_run() {
  local mode="$1" name="$2"
  shift 2

  local stdout stderr status
  stdout="$(mktemp)"
  stderr="$(mktemp)"

  printf '$ Run "%s": ' "$name"
  if "$@" >"$stdout" 2>"$stderr"; then
    status=0
  else
    status=1
  fi

  if [ $status -eq 1 ] && [[ $mode == required ]]; then
    status=2
  fi

  case "$status" in
  0) printf 'PASSED\n' ;;
  1) printf 'FAILED (OPTIONAL)\n' ;;
  2) printf 'FAILED\n' ;;
  esac

  if [ -s "$stdout" ]; then
    printf '  - OUTPUT::STDOUT\n'
    cat "$stdout"
  fi
  if [ -s "$stderr" ]; then
    printf '  - OUTPUT::STDERR\n'
    cat "$stderr"
  fi

  echo
  rm "$stdout" "$stderr"
}

_run required "check 1password account" \
  op whoami

GPG_FINGERPRINT="$(op item get \
  "$GPG_KEY_OP_ITEM" \
  --vault "$GPG_KEY_OP_VAULT" \
  --field label=Fingerprint)"

op document get \
  "$GPG_KEY_OP_ITEM" \
  --vault "$GPG_KEY_OP_VAULT" \
  --out-file "$GPG_PATH" >/dev/null

gpg --quiet --import "$GPG_PATH"
rm "$GPG_PATH"

# shellcheck disable=SC2086
_run required "apply chezmoi configuration" \
  chezmoi init --apply $CHEZMOI_ARGUMENTS
# shellcheck disable=SC2086
_run optional "check chezmoi status" \
  chezmoi status $CHEZMOI_ARGUMENTS
# shellcheck disable=SC2086
_run optional "check chezmoi doctor" \
  chezmoi doctor $CHEZMOI_ARGUMENTS
# shellcheck disable=SC2086
_run optional "check chezmoi path" \
  chezmoi managed --path-style absolute --tree $CHEZMOI_ARGUMENTS

temp="$(mktemp)" code=0
# shellcheck disable=SC2086
chezmoi status $CHEZMOI_ARGUMENTS | tee "$temp"
test -s "$temp" && code=1

if [ -n "$GPG_FINGERPRINT" ]; then
  gpg --batch --yes --delete-secret-and-public-key "$GPG_FINGERPRINT"
fi

exit $code
