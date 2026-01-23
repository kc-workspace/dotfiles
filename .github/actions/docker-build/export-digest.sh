#!/usr/bin/env bash

set -euo pipefail

main() {
  local key_prefix="$1" key="$2" digest="$3"
  local dir="$RUNNER_TEMP/$key_prefix"

  mkdir -p "$dir"
  touch "$dir/${digest#sha256:}"
  printf '>> Create digest file: %s\n' "$dir/${digest#sha256:}" >&2

  {
    add_item "key_prefix" "$key_prefix"
    add_item "key" "$key"
    add_item "path" "$dir/*"
  } >>"$GITHUB_OUTPUT"
  return 0
}

add_item() {
  local key="$1" value="$2"
  echo "$key=$value"
  printf ">> Set '%-20s' to value: '%s'\n" "$key" "$value" >&2
}

: "${DIGEST_PREFIX:?}"
: "${DIGEST_KEY:?}"
: "${DIGEST:?}"
: "${GITHUB_OUTPUT:?}"
: "${RUNNER_TEMP:?}"

main "$DIGEST_PREFIX" "$DIGEST_KEY" "$DIGEST"
