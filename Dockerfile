# Use Ubuntu latest LTS
FROM ubuntu:latest

## Setup os dependencies:
## - tzdata        - set timezone
## - curl          - required by chezmoi
## - gpg           - for encrypt & decrypt file
## - sudo          - prevent accident root command executes
## - zsh           - primary login shell
## - vim           - modify files
## - 1password-cli - dotfiles plugins (required by chezmoi)
## - git           - dotfiles plugins (required by zinit)
## - python3       - dotfiles plugins (required by alias-tip)
## - file          - dotfiles plugins (required by starship)
RUN apt update \
  && apt install -y tzdata curl gpg
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
  && apt install -y sudo zsh vim 1password-cli git python3 file \
  && apt upgrade -y \
  && apt clean

## Set build environment variables.
ENV USER="kamontat"
ENV TZ="Asia/Bangkok"
ENV SHELL="/usr/bin/zsh"
ENV EDITOR="vim"

## Must matched with .chezmoiversion file
ENV CHEZMOI_VERSION="2.55.0"
## Init arguments (e.g. --one-shot)
ENV CHEZMOI_ARGUMENTS="--apply"

ENV USER_HOME="/home/$USER"
ENV USER_BIN="/usr/local/bin"
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
  && touch "$HOME/.zshrc" \
  && sudo sh -c "$(curl -fsLS git.io/chezmoi)" -- -b "$USER_BIN" -t "v$CHEZMOI_VERSION"

## Copy the dotfiles
COPY --chown=$USER . $CHEZMOI_HOME
## Configure dotfiles
RUN sudo mv $CHEZMOI_HOME/scripts/*.sh "$USER_BIN" \
  && rm -rf "$CHEZMOI_HOME/.github" \
  && rm -rf "$CHEZMOI_HOME/.git" \
  && chezmoi init

ENTRYPOINT [ "entrypoint.sh" ]
