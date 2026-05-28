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
- [Usage](#usage)
  - [Prerequisite](#prerequisite)
  - [Quick start](#quick-start)
  - [Actions](#actions)
  - [To update target directory](#to-update-target-directory)
  - [To uninstall dotfiles](#to-uninstall-dotfiles)
- [Features](#features)
  - [Zinit](#zinit)
    - [To upgrade zinit](#to-upgrade-zinit)
    - [To upgrade plugins](#to-upgrade-plugins)
  - [Homebrew](#homebrew)
    - [To upgrade packages](#to-upgrade-packages)
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

## Usage

### Prerequisite

1. Install [chezmoi][cz:install]

### Quick start

1. Open `Terminal` app
2. Copy command below each line and enter one line at the time

```shell
sh -c "$(curl -fsSL git.io/chezmoi)" -- -b "$HOME/.local/bin" -t "v2.64.0"
"$HOME/.local/bin/chezmoi" init --apply --purge-binary --no-pager --no-tty --exclude=encrypted "https://github.com/kc-workspace/dotfiles.git"
```

### Actions

> https://www.chezmoi.io/user-guide/daily-operations/
>
> https://www.chezmoi.io/user-guide/command-overview/

Below are a list of actions you might perform when use this repository.

### To update target directory

```shell
chezmoi init --apply
```

### To uninstall dotfiles

```shell
chezmoi purge
```

## Features

- [Zsh][zsh:home] configuration: [here][local:zshrc]
  - [Zinit](#zinit) - Zsh plugin manager
- [Git][git:home] configuration: [here][local:gitconfig]
- Application and packages (via [Homebrew][hb:home] or [apt][apt:home])
  - [Homebrew][#homebrew] - Package manager
  - View installed applications [here][local:packages]
- Commandline tools (via [mise][mi:home])
  - View install tools [here][local:mise]
- Working directory layout: [here][local:documents]
  - **Personal** directory for personal projects
  - **Works** directory for work projects, organized by workplace
- Encrypted files via [gpg][cz:gpg]
- Password manager via [1Password][1p:home]

### Zinit

**Installation method**: [chezmoi/external][cz:external]

#### To upgrade zinit

```shell
zinit self-update
```

#### To upgrade plugins

```shell
zinit update --all
```

### Homebrew

**Installation method**: [chezmoi/external][cz:external]

#### To upgrade packages

`--greedy` will also upgrade cask with `:latest` or `:auto-upgrade`.

```shell
brew upgrade --greedy
```

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
[gpg:home]: https://www.gnupg.org/
[apt:home]: https://manpages.ubuntu.com/manpages/xenial/man8/apt.8.html

[local:zshrc]: ./home/dot_zshrc
[local:gitconfig]: ./home/dot_gitconfig.tmpl
[local:documents]: ./home/private_Documents/
[local:packages]: ./home/.chezmoidata/packages.yaml
[local:mise]: ./home/dot_config/mise/config.toml
[local:contributing]: ./CONTRIBUTING.md
