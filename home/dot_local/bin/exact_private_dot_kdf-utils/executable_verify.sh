#!/usr/bin/env bash
# shellcheck disable=SC1091

set -euo pipefail

_verify_system() {
  progress "Verify system"
  mise exec fastfetch -- \
    fastfetch --logo none
  progress_end
}

_verify_command() {
  local cmd="$1" cmd_path=""
  cmd_path="$(command -v "$cmd" || true)"
  shift

  info "Fetching...  %10s : " "$cmd"
  if [ -n "$cmd_path" ]; then
    echo "$cmd_path"

    if [ $# -gt 0 ]; then
      info "%23s : " ""
      $cmd "$@" | head -n1 || true ## Get command version
    fi
  else
    echo "<Not found>"
    return 99
  fi
}
