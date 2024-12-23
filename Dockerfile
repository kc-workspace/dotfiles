# Use Ubuntu latest LTS
FROM ubuntu:latest

## Setup os dependencies:
## - locales - set locales
## - tzdata  - set timezone
## - curl    - required by chezmoi
## - gpg     - for encrypt & decrypt file
## - sudo    - prevent accident root command executes
RUN apt update \
  && apt install -y locales tzdata curl gpg sudo \
  && apt upgrade -y \
  && apt clean

## Install required linux dependencies to speed up build docker process
RUN apt install -y zsh git file cloc unzip file \
  && apt clean

## Set build environment variables.
ENV USER="kamontat"
ENV TZ="Asia/Bangkok"
ENV SHELL="/usr/bin/zsh"
ENV KCDF_REPO="kc-workspace/dotfiles"
ENV KCDF_BRANCH="main"

## Set up locales (Required because tab completions bug)
## ref: https://github.com/zsh-users/zsh-autosuggestions/issues/683
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
  && locale-gen
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en

## Must matched with .chezmoiversion file
ENV CHEZMOI_VERSION="2.55.0"

ENV USER_HOME="/home/$USER"
ENV USER_BIN="$USER_HOME/.local/bin"
ENV CHEZMOI_HOME="$USER_HOME/.local/share/chezmoi"

ENV DEBIAN_FRONTEND=noninteractive
ENV DOCKER=true

## Setup startup shell
RUN chsh -s $SHELL

## Setup user with sudo configured
RUN useradd --create-home --uid 5000 --group sudo --shell $SHELL $USER \
  && echo "%$USER ALL=(ALL) NOPASSWD:ALL" >"/etc/sudoers.d/$USER-group"
USER $USER
WORKDIR $USER_HOME

## Prepare && Install chezmoi
RUN mkdir -p "$CHEZMOI_HOME" \
  && mkdir -p "$USER_BIN" \
  && sudo sh -c "$(curl -fsLS git.io/chezmoi)" -- -b "$USER_BIN" -t "v$CHEZMOI_VERSION"

## Copy the dotfiles
COPY --chown=$USER . $CHEZMOI_HOME

## Configure dotfiles
## We purge binary because we will use mise to install it instead
RUN --mount=type=secret,id=GITHUB_TOKEN,env=GITHUB_TOKEN,required=false $USER_BIN/chezmoi init --apply \
  --no-pager --no-tty \
  --purge-binary --force \
  --exclude=encrypted

## FIXME: This only install plugins that don't have wait ice
RUN zsh -c "source $HOME/.zshrc"

ENTRYPOINT [ "zsh" ]
