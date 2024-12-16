#!/usr/bin/env bash

set -e

KCDF_MODE="${1:-}"
case $KCDF_MODE in
full-version | full | f) KCDF_MODE=full bash setup-full.sh ;;
minimal | min | m) KCDF_MODE=minimal bash setup-minimal.sh ;;
"") ;;
*) printf 'Invalid input mode: %s\n' "$KCDF_MODE" >&2 && exit 2 ;;
esac

if [ $# -gt 1 ]; then
  shift
  "$@"
else
  exec "$SHELL"
fi
