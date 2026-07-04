#!/usr/bin/env bash
# shellcheck disable=SC1091

set -euo pipefail

chezmoi_setup() {
  progress "Set up chezmoi config"
  _chezmoi_init \
    --apply \
    --promptDefaults \
    --promptBool "Enable 1Password=true,Enable age=true"
  progress_end
}

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
