# Use Ubuntu latest LTS
FROM ubuntu:latest

## Setup os dependencies:
## - tzdata        - set timezone
## - curl          - required by chezmoi
## - gpg           - for encrypt & decrypt file
## - sudo          - prevent accident root command executes
## - 1password-cli - required by chezmoi
RUN apt update \
  && apt install -y tzdata curl gpg sudo
## Set up
RUN curl -sS https://downloads.1password.com/linux/keys/1password.asc \
  | gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" \
  | tee /etc/apt/sources.list.d/1password.list \
  && mkdir -p /etc/debsig/policies/AC2D62742012EA22/ \
  && curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol \
  | tee /etc/debsig/policies/AC2D62742012EA22/1password.pol \
  && mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22 \
  && curl -sS https://downloads.1password.com/linux/keys/1password.asc \
  | gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg \
  && apt update \
  && apt install -y 1password-cli \
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

## Required because of tab completions duplication
## ref: https://github.com/zsh-users/zsh-autosuggestions/issues/683
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8

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
RUN --mount=type=secret,id=github_token,env=GITHUB_TOKEN,required=false $USER_BIN/chezmoi init --apply \
  --no-pager --no-tty \
  --purge-binary --force \
  --exclude=encrypted

RUN zsh -c "source $HOME/.zshrc"

ENTRYPOINT [ "zsh" ]
