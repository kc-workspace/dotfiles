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
  - [Zinit](#zinit)
    - [To upgrade zinit](#to-upgrade-zinit)
    - [To upgrade plugins](#to-upgrade-plugins)
- [Usage](#usage)
  - [Prerequisite](#prerequisite)
  - [Quick start](#quick-start)
- [Actions](#actions)
  - [To update target directory](#to-update-target-directory)
  - [To uninstall dotfiles](#to-uninstall-dotfiles)
  - [To upgrade tools](#to-upgrade-tools)
    - [Homebrew](#homebrew)
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
  - [Zinit](#zinit) - Zsh plugin manager
- [Git][git:home] configuration: [here][local:gitconfig]
- Application and packages (via [Homebrew][hb:home])
  - View installed applications [here][local:packages]
- Commandline tools (via [mise][mi:home])
  - View install tools [here][local:mise]
- Working directory layout: [here][local:documents]
  - **Personal** directory for personal projects
  - **Works** directory for work projects, organized by workplace
- Password manager via [1Password][1p:home]
- Encrypted files via [gpg][cz:gpg]

### Zinit

**Installation method**: [chezmoi/external][cz:external]

#### To upgrade zinit

```bash
zinit self-update
```

#### To upgrade plugins

```bash
zinit update --all
```

## Usage

<!-- TODO: Short introduction to usage section -->

### Prerequisite

1. Install [chezmoi][cz:install]
3. [Optional] Install [gpg][gpg-url] for decrypt files (required on full setup)

### Quick start

<!-- TODO: Add quick-start guide -->

## Actions

> https://www.chezmoi.io/user-guide/daily-operations/
> https://www.chezmoi.io/user-guide/command-overview/

Below are a list of actions you might perform when use this repository.

### To update target directory

<!-- TODO: action -->

### To uninstall dotfiles

<!-- TODO: action -->

### To upgrade tools

Since we have several tools, each have it own ways to upgrade.
You might prefer do one-by-one instead of using script to upgrade all of them.

#### Homebrew

Add `--greedy` will install version **:latest** and **auto_updates true** as well.

```bash
brew upgrade --greedy
```

## Docker

<!-- TODO: action -->

## Contributing

Please refer to [CONTRIBUTING][local:contributing] guide.

<!-- LINKS SECTION -->

[gh:home]: https://github.com/kamontat/
[cz:install]: https://www.chezmoi.io/install/
[cz:external]: https://www.chezmoi.io/reference/special-files/chezmoiexternal-format/
[cz:reference]: https://www.chezmoi.io/reference/
[cz:gpg]: https://www.chezmoi.io/user-guide/encryption/gpg/
[hb:home]: https://brew.sh/
[mi:home]: https://mise.jdx.dev/
[zsh:home]: https://www.zsh.org/
[git:home]: https://git-scm.com/
[1p:home]: https://1password.com/

[local:zshrc]: ./home/dot_zshrc
[local:gitconfig]: ./home/dot_gitconfig.tmpl
[local:documents]: ./home/private_Documents/
[local:packages]: ./home/.chezmoidata/packages.yaml
[local:mise]: ./home/dot_config/mise/config.toml
[local:contributing]: ./CONTRIBUTING.md
