# Use Ubuntu latest LTS
ARG IMAGE=ubuntu:latest
FROM ${IMAGE}

ARG KCDF_REPO="kc-workspace/dotfiles"
ARG KCDF_REF="branch/main"
ARG KCDF_SHA="latest"
ARG USER="kamontat"

## Set build environment variables.
ENV TZ="Asia/Bangkok"
ENV SHELL="/usr/bin/zsh"

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en

ENV BREW_HOME="/home/linuxbrew"
ENV USER_HOME="/home/$USER"
ENV USER_BIN="$USER_HOME/.local/bin"
ENV CHEZMOI_HOME="$USER_HOME/.local/share/chezmoi"

## So apt and others won't ask for user input in automated builds
ENV DEBIAN_FRONTEND=noninteractive NONINTERACTIVE=true
ENV DOCKER=true

## Setup os dependencies:
## - locales         - set locales
## - tzdata          - set timezone
## - curl            - required by chezmoi (and linuxbrew)
## - gpg             - for encrypt & decrypt file
## - sudo            - prevent accident root command executes
## - zsh             - default shell
RUN apt update \
  && apt install -y locales tzdata curl gpg sudo zsh \
  && apt upgrade -y \
  && apt clean

## Set up locales (Required because tab completions bug)
## ref: https://github.com/zsh-users/zsh-autosuggestions/issues/683
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
  && locale-gen

## Install required linux dependencies
## - git             - required by chezmoi (and linuxbrew)
## - build-essential - required by linuxbrew
## - file            - required by linuxbrew
## - procps          - required by linuxbrew
## - unzip           - required by some mise tools
RUN apt install -y git build-essential file procps unzip \
  && apt clean

## Setup startup shell
RUN chsh -s $SHELL

## Setup users and permissions
## Prepare homebrew home directory
RUN useradd --create-home --uid 5000 --group sudo --shell $SHELL $USER \
  && echo "%$USER ALL=(ALL) NOPASSWD:ALL" >"/etc/sudoers.d/$USER-group" \
  && mkdir -p $BREW_HOME

## Setup user with sudo configured
USER $USER
WORKDIR $USER_HOME

## Prepare && Install chezmoi
COPY --chown=$USER ./.chezmoiversion /tmp
RUN mkdir -p "$CHEZMOI_HOME" \
  && mkdir -p "$USER_BIN" \
  && sudo sh -c "$(curl -fsSL git.io/chezmoi)" -- -b "$USER_BIN" -t "v$(cat /tmp/.chezmoiversion)" \
  && rm -f /tmp/.chezmoiversion

## Copy the dotfiles
COPY --chown=$USER . $CHEZMOI_HOME

## Configure dotfiles
## We purge binary because we will use mise to install it instead
RUN --mount=type=secret,id=GITHUB_TOKEN,env=GITHUB_TOKEN,required=false $USER_BIN/chezmoi init --apply \
  --no-pager --no-tty \
  --purge-binary --force \
  --exclude=encrypted

## NOTE: To install all plugins regardless of turbo mode is enabled or not
## ref: https://github.com/zdharma-continuum/zinit/issues/321#issuecomment-1183650509
RUN zsh -ic -- "@zinit-scheduler burst"

## Reset Dockerfile environment variables
ENV DEBIAN_FRONTEND= NONINTERACTIVE=
ENV BREW_HOME= USER_HOME= USER_BIN= CHEZMOI_HOME=

ENTRYPOINT [ "zsh" ]
