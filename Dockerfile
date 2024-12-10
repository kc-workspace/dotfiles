# Use Ubuntu latest LTS
FROM ubuntu:latest

## Set build environment variables.
ENV USER="kamontat"
ENV TZ="Asia/Bangkok"
ENV DEBIAN_FRONTEND=noninteractive

## Setup os dependencies
RUN apt update && apt upgrade \
  && apt install -y sudo curl zsh tzdata gpg \
  && apt clean

## Setup startup shell
ENV SHELL="/usr/bin/zsh"
RUN chsh -s $SHELL

## Add a new user to the sudo group
RUN useradd -ms /bin/bash $USER && \
  usermod -a -G sudo $USER && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

## Assume the user
USER $USER
ENV USER_HOME="/home/$USER"
WORKDIR $USER_HOME

## Install essential linux dependencies
# COPY ./setup/linux/deps /tmp/deps
# RUN /tmp/deps/install.sh

## Setup the chezmoi directory
ENV CHEZMOI_HOME="$USER_HOME/.local/share/chezmoi"
ENV CHEZMOI_VERSION_FILE="$CHEZMOI_HOME/.chezmoiversion"
ENV CHEZMOI_BIN="$USER_HOME/bin"
ENV PATH="$CHEZMOI_BIN:$PATH"

## Copy the dotfiles
COPY --chown=$USER . $CHEZMOI_HOME

## Prepare directories
RUN mkdir -p "$CHEZMOI_HOME" \
  && mkdir -p "$CHEZMOI_BIN" \
  && mv "$CHEZMOI_HOME/scripts/entrypoint.sh" "$CHEZMOI_BIN/entrypoint.sh"

## Prepare chezmoi binary
RUN sh -c "$(curl -fsLS git.io/chezmoi)" -- -b "$CHEZMOI_BIN" -t "v$(cat $CHEZMOI_VERSION_FILE)"

ENTRYPOINT [ "entrypoint.sh" ]
