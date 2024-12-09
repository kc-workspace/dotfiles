# Use Ubuntu LTS
FROM ubuntu:noble

## Set build environment variables.
ENV USER="kamontat"
ENV TZ="Asia/Bangkok"
ENV DEBIAN_FRONTEND=noninteractive

## Setup os dependencies
RUN apt update && apt upgrade \
  && apt install -y sudo curl zsh tzdata \
  && apt clean

## Setup startup shell
RUN chsh -s /usr/bin/zsh

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

## Install chezmoi binary
RUN mkdir -p "$CHEZMOI_HOME" \
  && mkdir -p "$CHEZMOI_BIN" \
  && sh -c "$(curl -fsLS git.io/chezmoi)" -- -b "$CHEZMOI_BIN" -t "v$(cat $CHEZMOI_VERSION_FILE)"

## Apply chezmoi source state and configuration
RUN $USER_HOME/bin/chezmoi init --apply

## Start zsh shell
CMD ["zsh"]
