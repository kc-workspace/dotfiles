#!/usr/bin/env bash
# shellcheck disable=SC1091

set -euo pipefail

debug() {
  _log "DBG" "$@"
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

_log() {
  local ns="$1" format="$2"
  shift 2

  printf "[%-3s] $format" "$ns" "$@"
}
