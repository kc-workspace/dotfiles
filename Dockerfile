# Use Ubuntu latest LTS
FROM ubuntu:latest

## Set build environment variables.
ENV USER="kamontat"
ENV USER_HOME="/home/$USER"
ENV TZ="Asia/Bangkok"
ENV SHELL="/usr/bin/zsh"

ENV CHEZMOI_VERSION="2.55.0"
ENV CHEZMOI_HOME="$USER_HOME/.local/share/chezmoi"
ENV CHEZMOI_BIN="$USER_HOME/bin"

ENV DEBIAN_FRONTEND=noninteractive
ENV DOCKER=true

## Setup os dependencies
RUN apt update \
  && apt install -y tzdata curl gpg \
  && apt clean

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
  && apt update && apt upgrade \
  && apt install -y sudo zsh 1password-cli \
  && apt clean

## Setup startup shell
RUN chsh -s $SHELL

## Add a new user to the sudo group
RUN groupadd --gid 5000 $USER \
  && useradd --create-home --uid 5000 --no-user-group --group $USER --shell $SHELL $USER \
  && echo '%root ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

## Assume the user
USER $USER
WORKDIR $USER_HOME
## Prepare directories
RUN mkdir -p "$CHEZMOI_HOME" \
  && mkdir -p "$CHEZMOI_BIN" \
  && touch "$HOME/.zshrc"
## Install chezmoi
RUN sh -c "$(curl -fsLS git.io/chezmoi)" -- -b "$CHEZMOI_BIN" -t "v$CHEZMOI_VERSION"
ENV PATH="$CHEZMOI_BIN:$PATH"

## Install essential linux dependencies
# COPY ./setup/linux/deps /tmp/deps
# RUN /tmp/deps/install.sh

## Copy the dotfiles
COPY --chown=$USER . $CHEZMOI_HOME

RUN mv $CHEZMOI_HOME/scripts/*.sh "$CHEZMOI_BIN"
ENTRYPOINT [ "entrypoint.sh" ]
