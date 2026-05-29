# kc's dotfiles

Personal dotfiles configuration for [kamontat][gh:home].

- [Terminology](#terminology)
  - [Target/Destination](#targetdestination)
  - [Source](#source)
  - [Local repository](#local-repository)
  - [Remote repository](#remote-repository)
  - [Lite setup](#lite-setup)
  - [Full setup](#full-setup)
- [Usage](#usage)
  - [Prerequisite](#prerequisite)
  - [Get start](#get-start)
  - [Actions](#actions)
  - [To update target directory](#to-update-target-directory)
  - [To uninstall dotfiles](#to-uninstall-dotfiles)
- [Features](#features)
  - [Zinit](#zinit)
    - [To upgrade zinit](#to-upgrade-zinit)
    - [To upgrade plugins](#to-upgrade-plugins)
  - [Homebrew](#homebrew)
    - [To upgrade packages](#to-upgrade-packages)
  - [Docker](#docker)
    - [To verify docker image](#to-verify-docker-image)
      - [To verify Docker Hub image](#to-verify-docker-hub-image)
      - [To verify GitHub Container Registry image](#to-verify-github-container-registry-image)
  - [KDF helper scripts](#kdf-helper-scripts)
- [Contributing](#contributing)

## Terminology

> Please refer additional terminology on [chezmoi][cz:reference]

### Target/Destination

- `Destination Directory`: The destination being managed (typically `~`).
- `Target`: Individual files, directories, or symlinks within the target directory.
- `Target State`: The computed desired state for your Destination Directory.

### Source

- `Source Directory`: Where chezmoi stores the source state (`~/.local/share/chezmoi` by default).
- `Source State`: The desired state definition (includes templates and machine-specific data).

### Local repository

The git repository on your local machine (usually will be your [Source Directory](#source)),
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

1. Install `git` and `curl`
    - macos: `xcode-select --install`
2. Login to App Store

### Get start

1. Open `Terminal` app
2. Install chezmoi temporary (chezmoi will be managed by mise later)

```shell
sh -c "$(curl -fsSL git.io/chezmoi)" -- -b "$HOME/.local/bin" -t "v2.64.0"
```

3. Run `setup-script` first

```shell
## Install dependencies (e.g. brew, mise, 1password, etc.)
"$HOME/.local/bin/chezmoi" init kc-workspace \
  --apply --purge-binary --no-pager --no-tty --include=scripts
```

4. Set up 1Password account
5. Run `full-setup`

```shell
"$HOME/.local/bin/chezmoi" update kc-workspace --init --apply
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
- Working directory layout:
  - [Personal][local:personal] directory for personal projects
  - [Works][local:works] directory for work projects, organized by workplace
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

### Docker

dotfiles inside docker have 2 stage setup. By default, it will only have [lite-setup](#lite-setup).
To use full-setup, run `kdf-setup.sh` on docker instance.

```shell
## initiate zsh shell session
docker run -it --rm kamontat/dotfiles:local
```

#### To verify docker image

All docker image have attestations. You can verify the integrity and provenance
of an artifact using its associated cryptographically signed attestations.

The output of the verify command should contains as following information:

- Verify status: `✓ Verification succeeded!`
- **Repository** where image was created
- **Workflow** and **Git Reference** where image was created

##### To verify Docker Hub image

```shell
# gh attestation verify oci://kamontat/dotfiles:latest --owner kc-workspace
$ gh attestation verify "oci://kamontat/dotfiles:<tag-name>" --owner kc-workspace

...
✓ Verification succeeded!
...
```

##### To verify GitHub Container Registry image

```shell
## Add read:packages scope to read image from ghcr.
## You may need to login first: https://cli.github.com/manual/gh_auth_login
$ gh auth refresh --scopes "read:packages"

# gh auth token | docker login "ghcr.io" --username "kamontat" --password-stdin
$ gh auth token | docker login "ghcr.io" --username "<username>" --password-stdin

# gh attestation verify "oci://ghcr.io/kc-workspace/dotfiles:latest" --owner kc-workspace
$ gh attestation verify "oci://ghcr.io/kc-workspace/dotfiles:<tag-name>" --owner kc-workspace

...
✓ Verification succeeded!
...
```

### KDF helper scripts

We provide couple of helper scripts on `kdf-*.sh` which should available to everyone.
If you cannot use `kdf-*.sh`, please check `~/.local/bin` directory.

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
[local:personal]: ./home/Personal
[local:works]: ./home/Works
[local:packages]: ./home/.chezmoidata/packages.yaml
[local:mise]: ./home/dot_config/mise/config.toml
[local:contributing]: ./CONTRIBUTING.md
