#!/usr/bin/env bash

set -e

KCDF_MODE="${1:-}"
case $KCDF_MODE in
full-version | full | f) bash setup-full.sh ;;
minimal | min | m) bash setup-minimal.sh ;;
"") ;;
*) printf 'Invalid input mode: %s\n' "$KCDF_MODE" >&2 && exit 2 ;;
esac

if [ $# -gt 1 ]; then
  shift
  "$@"
else
  exec "$SHELL"
fi
