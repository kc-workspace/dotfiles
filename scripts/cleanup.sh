#!/usr/bin/env bash

## Remove developer commandline tools on macos
if [[ $(uname -s) == "Darwin" ]]; then
  if xcode-select -p &>/dev/null; then
    rm -rf "/Library/Developer/CommandLineTools"
  fi
fi

## Delete chezmoi source directory (if exists)
if [ -d "$HOME/.local/share/chezmoi" ]; then
  rm -r "$HOME/.local/share/chezmoi"
fi
