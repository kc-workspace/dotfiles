# Use Ubuntu latest LTS
FROM ubuntu:latest

## Set build environment variables.
ENV USER="kamontat"
ENV TZ="Asia/Bangkok"
ENV SHELL="/usr/bin/zsh"
ENV EDITOR="vim"

## Must matched with .chezmoiversion file
ENV CHEZMOI_VERSION="2.55.0"

ENV USER_HOME="/home/$USER"
ENV CHEZMOI_HOME="$USER_HOME/.local/share/chezmoi"
ENV CHEZMOI_BIN="$USER_HOME/bin"
ENV DEBIAN_FRONTEND=noninteractive
ENV DOCKER=true

## Setup os dependencies:
## - tzdata - set timezone
## - curl   - required by chezmoi
## - zsh    - login shell
## - vim    - for modify file in docker
## - sudo   - prevent accident root command executes
## - gpg    - for encrypt & decrypt file
RUN apt update && apt upgrade -y \
  && apt install -y tzdata curl zsh vim sudo gpg \
  && apt clean

## Setup startup shell
RUN chsh -s $SHELL

## Setup user with sudo configured
RUN useradd --create-home --uid 5000 --group sudo --shell $SHELL $USER \
  && echo "%$USER ALL=(ALL) NOPASSWD:ALL" >"/etc/sudoers.d/$USER-group"
USER $USER
WORKDIR $USER_HOME

## Prepare && Install chezmoi
ENV PATH="$CHEZMOI_BIN:$PATH"
RUN mkdir -p "$CHEZMOI_HOME" \
  && mkdir -p "$CHEZMOI_BIN" \
  && touch "$HOME/.zshrc" \
  && sh -c "$(curl -fsLS git.io/chezmoi)" -- -b "$CHEZMOI_BIN" -t "v$CHEZMOI_VERSION"

## Copy the dotfiles
COPY --chown=$USER . $CHEZMOI_HOME
## Configure dotfiles
RUN mv $CHEZMOI_HOME/scripts/*.sh "$CHEZMOI_BIN" \
  && rm -r "$CHEZMOI_HOME/.github" "$CHEZMOI_HOME/.git" \
  && chezmoi init

ENTRYPOINT [ "entrypoint.sh" ]
