# Use Ubuntu latest LTS
ARG IMAGE=ubuntu:latest
FROM ${IMAGE}

ARG KCDF_REPO="kc-workspace/dotfiles"
ARG KCDF_REF="branch/main"
ARG KCDF_SHA="latest"
ARG USER="kamontat"

ENTRYPOINT [ "bash" ]
