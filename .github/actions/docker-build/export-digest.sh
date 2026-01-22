#!/usr/bin/env bash

set -euo pipefail

main() {
  local key="$1" digest_prefix="$2" digest="$3"
  local name="$digest_prefix-$key" dir="$RUNNER_TEMP/$digest_prefix"

  mkdir -p "$dir"
  touch "$dir/${digest#sha256:}"
  printf '>> Create digest file: %s\n' "$dir/${digest#sha256:}" >&2

  {
    add_item "name" "$name"
    add_item "path" "$dir/*"
  } >>"$GITHUB_OUTPUT"
  return 0
}

add_item() {
  local key="$1" value="$2"
  echo "$key=$value"
  printf ">> Set '%-20s' to value: '%s'\n" "$key" "$value" >&2
}

: "${KEY:?}"
: "${DIGEST_PREFIX:?}"
: "${DIGEST:?}"
: "${GITHUB_OUTPUT:?}"
: "${RUNNER_TEMP:?}"

main "$KEY" "$DIGEST_PREFIX" "$DIGEST"
