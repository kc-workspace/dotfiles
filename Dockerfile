# Use Ubuntu latest LTS
ARG IMAGE=ubuntu:latest
FROM ${IMAGE}

ARG KCDF_REPO="kc-workspace/dotfiles"
ARG KCDF_REF="branch/main"
ARG KCDF_SHA="latest"
ARG USER="kamontat"

# Deterministic UID (first user). Helps with docker build cache
ENV USER_ID=1000
ENV TZ="Asia/Bangkok"
ENV SHELL="/usr/bin/zsh"
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en

ENV BREW_HOME="/home/linuxbrew"
ENV USER_HOME="/home/$USER"
ENV USER_BIN="$USER_HOME/.local/bin"
ENV CHEZMOI_HOME="$USER_HOME/.local/share/chezmoi"

ENV DEBIAN_FRONTEND=noninteractive NONINTERACTIVE=true
ENV DOCKER=true

# Delete the default ubuntu user & group UID=1000 GID=1000 in Ubuntu 23.04+
# that conflicts with the linuxbrew user
RUN grep "ubuntu" /etc/os-release && touch /var/mail/ubuntu \
  && chown ubuntu /var/mail/ubuntu \
  && userdel -r ubuntu || true

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  apt update && apt-get install -y --no-install-recommends \
  acl bzip2 ca-certificates curl file \
  g++ gawk git less locales make \
  netbase openssh-client patch sudo \
  unzip uuid-runtime tzdata jq \
  g++-12 skopeo zsh
#   && apt autoremove -y --purge \
#   && apt clean \
#   && rm -rf /var/lib/apt/lists/*

## Set up locales (Required because tab completions bug)
## ref: https://github.com/zsh-users/zsh-autosuggestions/issues/683
RUN localedef -i en_US -f UTF-8 en_US.UTF-8

## Setup startup shell
RUN chsh -s $SHELL

## Setup users and permissions
## Prepare homebrew home directory
RUN useradd --create-home --uid $USER_ID --group sudo --shell $SHELL $USER \
  && echo "%$USER ALL=(ALL) NOPASSWD:ALL" >"/etc/sudoers.d/$USER-group" \
  && mkdir -p "$BREW_HOME"

## Setup user with sudo configured
USER $USER
ENV USER=$USER
WORKDIR $USER_HOME

## Reset Dockerfile environment variables
ENV DEBIAN_FRONTEND= NONINTERACTIVE=
ENV BREW_HOME= USER_HOME= USER_BIN= CHEZMOI_HOME=

ENTRYPOINT [ "zsh" ]
