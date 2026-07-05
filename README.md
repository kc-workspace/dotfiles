# kc's dotfiles

Personal dotfiles configuration for [kamontat][gh:home].

- [Terminology](#terminology)
  - [Target/Destination](#targetdestination)
  - [Source](#source)
  - [Local Repository](#local-repository)
  - [Remote Repository](#remote-repository)
  - [Lite Setup](#lite-setup)
  - [Full Setup](#full-setup)
- [Usage](#usage)
  - [Prerequisites](#prerequisites)
  - [Getting Started](#getting-started)
  - [Actions](#actions)
  - [Update Target Directory](#update-target-directory)
  - [Uninstall Dotfiles](#uninstall-dotfiles)
- [Features](#features)
  - [Zinit](#zinit)
    - [Upgrade Zinit](#upgrade-zinit)
    - [Upgrade Plugins](#upgrade-plugins)
  - [LazyVim (Neovim)](#lazyvim-neovim)
    - [Upgrade Plugins](#upgrade-plugins-1)
  - [Homebrew](#homebrew)
    - [Upgrade Packages](#upgrade-packages)
  - [Mise](#mise)
  - [1Password](#1password)
  - [Alfred](#alfred)
    - [Setup](#setup)
  - [TablePlus](#tableplus)
  - [Okta Verify](#okta-verify)
  - [Keybase](#keybase)
  - [Docker](#docker)
    - [Verify Docker Image](#verify-docker-image)
      - [Verify Docker Hub Image](#verify-docker-hub-image)
      - [Verify GitHub Container Registry Image](#verify-github-container-registry-image)
  - [KDF Helper Scripts](#kdf-helper-scripts)
- [Known Gaps](#known-gaps)
  - [macOS](#macos)
- [Contributing](#contributing)

## Terminology

> For additional terminology, see [chezmoi reference][cz:reference].

### Target/Destination

- `Destination Directory`: The directory being managed (typically `~`).
- `Target`: Individual files, directories, or symlinks inside the destination directory.
- `Target State`: The computed desired state for your destination directory.

### Source

- `Source Directory`: Where chezmoi stores source state (`~/.local/share/chezmoi` by default).
- `Source State`: The desired state definition (including templates and machine-specific data).

### Local Repository

The Git repository on your local machine (usually your [Source Directory](#source)),
which contains your source state and configuration.

### Remote Repository

An external Git repository (for example, GitHub) that you push local changes to and pull updates from.
This is how you sync your dotfiles across multiple machines.

### Lite Setup

Install only non-encrypted data based on data flags.

```shell
chezmoi init kc-workspace --apply --force --purge-binary --promptDefaults
```

### Full Setup

Install all configured data based on data flags.

Requirement:
- `$HOME/.config/chezmoi/key.txt` (otherwise, setup scripts will prompt for the encryption password).

```shell
chezmoi init kc-workspace --apply --force --purge-binary \
  --promptDefaults --promptBool "Enable 1Password=true,Enable age=true"
```

## Usage

### Prerequisites

1. Sign in to the App Store.

### Getting Started

1. Open the `Terminal` app.
2. Install Homebrew (macOS only).

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3. Install prerequisite dependencies.

```shell
## macOS
brew install git

## Debian-based
apt install -y git curl

## Alpine-based
apk add -y git curl
```

4. Install chezmoi temporarily via direct download.

```shell
sh -c "$(curl -fsSL get.chezmoi.io)" -- -b "$HOME/.local/bin" -t "v2.70.5"
```

5. Initialize the chezmoi repository.

```shell
## Add --dry-run to check the expected result first
"$HOME/.local/bin/chezmoi" init kc-workspace \
  --apply --force --purge-binary --promptDefaults
```

6. Sign in to your account in the 1Password app.
7. Enable Developer mode in 1Password ([learn more][1p:cli]).
   - Enable `Show 1Password Developer experience`.
   - Enable `Integrate with 1Password CLI`.
   - Enable `Integrate with other apps`.
   - Enable `Check for developer credentials on disk`.
8. Open a new terminal window or tab. Zinit should start downloading dependencies.
9. Validate `op` status (optional).

```shell
## Validate account status
op whoami
# URL:        https://my.1password.com/
# Email:      <your-email>
# User ID:    <your-user-id>
```

10. Get the full-setup encryption password from 1Password (optional).

```shell
## Use app search bar
# 7qxsqxktd3qziyp2m2hzw7bpp4

## Use 1Password CLI
op read --account my "op://h75rks2xxgluyljikha4oforri/7qxsqxktd3qziyp2m2hzw7bpp4/password"
```

11. Run full setup.

```shell
## This prompts for the encryption password from step 10
kdf-setup-full.sh
```

12. Restart your computer at least once to apply all changes.

### Actions

- https://www.chezmoi.io/user-guide/daily-operations/
- https://www.chezmoi.io/user-guide/command-overview/

Common actions you might perform with this repository:

### Update Target Directory

```shell
chezmoi update --init --apply
```

### Uninstall Dotfiles

```shell
chezmoi purge
```

## Features

- [Zsh][zsh:home] configuration: [here][local:zshrc]
  - [Zinit](#zinit) as the Zsh plugin manager
- [Git][git:home] configuration: [here][local:gitconfig]
- Applications and packages (via [Homebrew][hb:home] or [apt][apt:home])
  - [Homebrew](#homebrew) as package manager
  - Installed applications list: [here][local:packages]
- Command-line tools (via [mise][mi:home])
  - Installed tools: [here][local:mise]
- Working directory layout
  - [Personal][local:personal] for personal projects
  - [Works][local:works] for work projects, organized by workplace
- Encrypted files via [gpg][cz:gpg]
- Password manager via [1Password][1p:home]

### Zinit

**Installation method**: [chezmoi/external][cz:external]

#### Upgrade Zinit

```shell
zinit self-update
```

#### Upgrade Plugins

```shell
zinit update --all
```

### LazyVim (Neovim)

**Installation method**: [mise](#mise)

Used to manage Neovim plugins and configuration.

#### Upgrade Plugins

```shell
nvim --headless -c '+Lazy! sync' +qa
```

### Homebrew

**Installation method**: [chezmoi/external][cz:external]

#### Upgrade Packages

`--greedy` also upgrades casks with `:latest` or `:auto-upgrade`.

```shell
brew upgrade --greedy
```

### Mise

<!-- TODO: Add mise-related documents -->

Main config:
- `$HOME/.config/mise/config.toml`

Additional configs:
- `~/Works/<name>/mise.toml` for work-related config
- `~/Personal/mise.toml` for personal-related config

### 1Password

**Installation method**: [Homebrew](#homebrew) ([mise](#mise) for CLI)

This is the core app that ties the configuration together.
All secrets and private documents are stored in 1Password.

### Alfred

**Installation method**: [Homebrew](#homebrew)

- License location: [1Password](#1password)
- Preference location: iCloud

#### Setup

1. Enter your license (if any).
2. Enable the permissions requested by the app.
3. Go to `Preferences > Advanced > Reveal in Finder`.
4. Copy your existing configuration and replace the current one.

### TablePlus

**Installation method**: Setapp

- Connections file: iCloud
- Connection passwords: 1Password

### Okta Verify

**Installation method**: [Homebrew](#homebrew)

> Important: You need your previous device to transfer an account.
> If your device was reset or sold, use the account recovery method.

### Keybase

**Installation method**: [Homebrew](#homebrew)

> Important: You need your previous device to transfer an account.
> If your device was reset or sold, use the account recovery method.

### Docker

Dotfiles in Docker have a two-stage setup.
By default, only [Lite Setup](#lite-setup) is applied.
To use full setup, run `kdf-setup.sh` in the Docker instance.

```shell
## Start an interactive shell session
docker run -it --rm kamontat/dotfiles:local
```

#### Verify Docker Image

All Docker images include attestations. You can verify integrity and provenance
using the associated cryptographically signed attestations.

Verification output should include:

- Status: `✓ Verification succeeded!`
- The **repository** where the image was created
- The **workflow** and **Git reference** used to create the image

##### Verify Docker Hub Image

```shell
# gh attestation verify oci://kamontat/dotfiles:latest --owner kc-workspace
$ gh attestation verify "oci://kamontat/dotfiles:<tag-name>" --owner kc-workspace

...
✓ Verification succeeded!
...
```

##### Verify GitHub Container Registry Image

```shell
## Add read:packages scope to read images from GHCR
## You may need to log in first: https://cli.github.com/manual/gh_auth_login
$ gh auth refresh --scopes "read:packages"

# gh auth token | docker login "ghcr.io" --username "kamontat" --password-stdin
$ gh auth token | docker login "ghcr.io" --username "<username>" --password-stdin

# gh attestation verify "oci://ghcr.io/kc-workspace/dotfiles:latest" --owner kc-workspace
$ gh attestation verify "oci://ghcr.io/kc-workspace/dotfiles:<tag-name>" --owner kc-workspace

...
✓ Verification succeeded!
...
```

### KDF Helper Scripts

The repository provides helper scripts named `kdf-*.sh` that should be available to everyone.
If you cannot run `kdf-*.sh`, check your `~/.local/bin` directory.

## Known Gaps

There are still a few things we cannot automate.

### macOS

- Menu bar items: `System Settings > Menu Bar > Menu Bar Controls`

## Contributing

Please refer to the [CONTRIBUTING][local:contributing] guide.

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
[1p:cli]: https://www.1password.dev/cli/get-started
[gpg:home]: https://www.gnupg.org/
[apt:home]: https://manpages.ubuntu.com/manpages/xenial/man8/apt.8.html

[local:zshrc]: ./home/dot_zshrc
[local:gitconfig]: ./home/dot_gitconfig.tmpl
[local:personal]: ./home/Personal
[local:works]: ./home/Works
[local:packages]: ./home/.chezmoidata/packages.yaml
[local:mise]: ./home/dot_config/mise/config.toml
[local:contributing]: ./CONTRIBUTING.md

<!-- START Actions
- Deploy files: unencrypted files | all files
  - use settings.age and settings.onepassword data flag with prompt* helper
- mise: all tools | selected tools | no tools
  - use dependencies.mise data flag with chezmoiscript
- zinit: lazy plugins | preinstall plugins
  - use dependencies.zinit data flag with chezmoiscript
- nvim: lazy plugins | preinstall plugins
  - use dependencies.nvim data flag with chezmoiscript
- github, onepassword
  - use kdf-setup.sh script to set up secret value
END Actions -->
