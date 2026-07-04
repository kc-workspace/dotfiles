#!/usr/bin/env bash
# shellcheck disable=SC1091

set -euo pipefail

_chezmoi_init() {
  _chezmoi init --promptDefaults "$@"
}

_chezmoi() {
  local args=(
    --config-format yaml
    --force
  )
  if [[ -n $CI ]]; then
    args+=(
      --less-interactive
      --progress false
      --color false
      --no-tty
    )
  fi
  if [[ -n "${CHEZMOI_SOURCE:-}" ]]; then
    args+=(--source "$CHEZMOI_SOURCE")
  fi
  if [[ -n "${CHEZMOI_DATA:-}" ]]; then
    args+=(--override-data "$CHEZMOI_DATA")
  elif [[ -n "${CHEZMOI_DATA_FILE:-}" ]]; then
    args+=(--override-data-file "$CHEZMOI_DATA_FILE")
  fi
  if [[ -n ${DEBUG:-} ]]; then
    args+=(--verbose)
  fi

  set -x
  chezmoi "${args[@]}" "$@"
  set +x
}
