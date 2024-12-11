#!/usr/bin/env bash

set -e

echo "# Initiate chezmoi with full-version mode

On this mode, we will install 1password-cli for decrypt file.
"

install_1password() {
  if command op >/dev/null 2>&1; then
    return 0
  fi

  local OP_ARCH
  OP_ARCH="$(dpkg --print-architecture)"

  local OP_KEY_PATH="/usr/share/keyrings/1password-archive-keyring.gpg"
  local OP_KEY_URL="https://downloads.1password.com/linux/keys/1password.asc"
  local OP_DEBSIG_URL="https://downloads.1password.com/linux/debian/debsig/1password.pol"
  local OP_DEBSIG_DIR="/etc/debsig/policies/AC2D62742012EA22"
  local OP_DEBSIG_PATH="$OP_DEBSIG_DIR/1password.pol"
  local OP_DEBSIG_KEY_DIR="/usr/share/debsig/keyrings/AC2D62742012EA22"
  local OP_DEBSIG_KEY_PATH="$OP_DEBSIG_KEY_DIR/debsig.gpg"
  local OP_DOWNLOAD_URL="https://downloads.1password.com/linux/debian/$OP_ARCH"
  local OP_APT_SOURCE="/etc/apt/sources.list.d/1password.list"

  sudo mkdir -p "$OP_DEBSIG_DIR" && sudo mkdir -p "$OP_DEBSIG_KEY_DIR"
  sudo curl -sS "$OP_KEY_URL" | sudo gpg --quiet --dearmor --output "$OP_KEY_PATH"
  echo "deb [arch=$OP_ARCH signed-by=$OP_KEY_PATH] $OP_DOWNLOAD_URL stable main" |
    sudo tee $OP_APT_SOURCE >/dev/null
  curl -sS "$OP_DEBSIG_URL" | sudo tee "$OP_DEBSIG_PATH" >/dev/null
  sudo curl -sS "$OP_KEY_URL" | sudo gpg --quiet --dearmor --output "$OP_DEBSIG_KEY_PATH"

  sudo apt update
  sudo apt install -y 1password-cli
  sudo apt clean
}

install_1password

: "${OP_SERVICE_ACCOUNT_TOKEN:=${OP_TOKEN:-${TOKEN}}}"
export OP_ACCOUNT="my.1password.com"
export OP_SERVICE_ACCOUNT_TOKEN

## Ask for service-account token (1password)
if [ -z "$OP_SERVICE_ACCOUNT_TOKEN" ]; then
  echo -n 'Enter 1Password service account token: '
  read -rs OP_SERVICE_ACCOUNT_TOKEN
  echo
fi

if op whoami; then
  ## To view items and ids: `op document list`
  GPG_KEY_OP_ITEM="fp3xx4qmu7ocxr2r546q6deocu"
  GPG_KEY_OP_VAULT="64yg7lvccdzebup52w2nmzoady"
  GPG_PATH="/tmp/gpg.asc"
  GPG_FINGERPRINT="$(op item get \
    "$GPG_KEY_OP_ITEM" \
    --vault "$GPG_KEY_OP_VAULT" \
    --field label=Fingerprint)"

  op document get \
    "$GPG_KEY_OP_ITEM" \
    --vault "$GPG_KEY_OP_VAULT" \
    --out-file "$GPG_PATH" >/dev/null

  gpg --import "$GPG_PATH"
  rm "$GPG_PATH"
fi

chezmoi apply

if [ -n "$GPG_FINGERPRINT" ]; then
  gpg --batch --yes --delete-secret-and-public-key "$GPG_FINGERPRINT"
fi
