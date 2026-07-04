#!/usr/bin/env bash
# shellcheck disable=SC1091

set -euo pipefail

zinit_setup() {
  progress "Set up zinit plugins"
  zsh -ic -- "@zinit-scheduler burst"
  progress_end
}
