#!/usr/bin/env bash
# shellcheck disable=SC1091

set -euo pipefail

debug() {
  if [ -n "${DEBUG:-}" ]; then
    _log "DBG" "$@"
  fi
}

info() {
  _log "INF" "$@"
}

warn() {
  _log "WRN" "$@"
}

error() {
  _log "ERR" "$@"
}

progress() {
  _log "PGS" "$@"
  echo && echo '=================================================='
}
progress_end() {
  echo '--------------------------------------------------'
  echo
}

_log() {
  local ns="$1" format="$2"
  shift 2

  printf "[%-3s] $format" "$ns" "$@"
}
