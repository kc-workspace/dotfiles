# kc's dotfiles

Personal dotfiles configuration for [kamontat][gh:home].

- [Terminology](#terminology)
  - [Target directory](#target-directory)
    - [Target](#target)
    - [Target state](#target-state)
  - [Source directory](#source-directory)
    - [Source state](#source-state)
  - [Local repository](#local-repository)
  - [Remote repository](#remote-repository)
  - [Lite setup](#lite-setup)
  - [Full setup](#full-setup)
- [Features](#features)
- [Usage](#usage)
  - [Prerequisite](#prerequisite)
  - [Quick start](#quick-start)
- [Actions](#actions)
  - [To update target directory](#to-update-target-directory)
  - [To uninstall dotfiles](#to-uninstall-dotfiles)
- [Docker](#docker)
- [Contributing](#contributing)

## Terminology

> Please refer additional terminology on [chezmoi][cz:reference]

### Target directory

The destination directory being managed (typically `~`).

#### Target

Individual files, directories, or symlinks within the target directory.

#### Target state

The computed desired state for your target directory
(derived from source state, config, and current destination state).

### Source directory

Where chezmoi stores the source state (`~/.local/share/chezmoi` by default).

#### Source state

The desired state definition (includes templates and machine-specific data).

### Local repository

The git repository on your local machine
(usually will be your [source directory](#source-directory)),
which contains the source state and configuration.

### Remote repository

An external git repository (e.g. GitHub)
that you push your local changes to and pull updates from.
This allows you to sync your dotfiles across multiple machines.

### Lite setup

This is **default** set up mode when install from Dockerfile.
Lite set up will ignore all encrypted files and only install sharable
configuration.

### Full setup

This only apply to [Lite setup](#lite-setup).
When use machine with `lite setup`,
you will have option to convert to full setup via `kdf-*` script.

## Features

- [Zsh][zsh:home] configuration: [here][local:zshrc]
- [Git][git:home] configuration: [here][local:gitconfig]
- Application and packages (via [Homebrew][hb:home])
  - View installed applications [here][local:packages]
- Commandline tools (via [mise][mi:home])
  - View install tools [here][local:mise]
- Working directory layout: [here][local:documents]
  - **Personal** directory for personal projects
  - **Works** directory for work projects, organized by workplace

## Usage

<!-- Short introduction to usage section -->

### Prerequisite

1. Install [chezmoi][cz:install]
2. [Optional] Install [gpg][gpg-url] for decrypt files (required on full setup)

### Quick start



## Actions

> https://www.chezmoi.io/user-guide/daily-operations/
> https://www.chezmoi.io/user-guide/command-overview/

Below are a list of actions you might perform when use this repository.

### To update target directory

### To uninstall dotfiles

## Docker

## Contributing

Please refer to [CONTRIBUTING][local:contributing] guide.

<!-- LINKS SECTION -->

[gh:home]: https://github.com/kamontat/
[cz:install]: https://www.chezmoi.io/install/
[cz:reference]: https://www.chezmoi.io/reference/
[hb:home]: https://brew.sh/
[mi:home]: https://mise.jdx.dev/
[zsh:home]: https://www.zsh.org/
[git:home]: https://git-scm.com/

[local:zshrc]: ./home/dot_zshrc
[local:gitconfig]: ./home/dot_gitconfig.tmpl
[local:documents]: ./home/private_Documents/
[local:packages]: ./home/.chezmoidata/packages.yaml
[local:mise]: ./home/dot_config/mise/config.toml
[local:contributing]: ./CONTRIBUTING.md
