#!/usr/bin/env bash

set -euo pipefail

: "${INPUT_KEY:?}"
: "${INPUT_DIGEST:?}"
: "${GITHUB_OUTPUT:?}"
: "${RUNNER_TEMP:?}"

OUTPUT_NAME="digest-$INPUT_KEY"
OUTPUT_DIR="$RUNNER_TEMP/digest"

mkdir -p "$OUTPUT_DIR"
touch "$OUTPUT_DIR/${INPUT_DIGEST#sha256:}"

{
  printf 'name=%s\n' "$OUTPUT_NAME"
  printf 'path=%s\n' "$OUTPUT_DIR/*"
} >>"$GITHUB_OUTPUT"

unset OUTPUT_NAME OUTPUT_DIR
