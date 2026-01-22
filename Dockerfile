# Use Ubuntu latest LTS
ARG IMAGE=ubuntu:latest
FROM ${IMAGE}

ARG KCDF_REPO="kc-workspace/dotfiles"
ARG KCDF_REF="branch/main"
ARG KCDF_SHA="latest"
ARG USER="kamontat"

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  apt update && apt --no-install-recommends install -y gcc git zsh file curl

RUN apt autoremove -y --purge && \
  apt clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "bash" ]
