# Use Ubuntu latest LTS
ARG IMAGE=ubuntu:latest
FROM ${IMAGE}

ARG KCDF_REPO="kc-workspace/dotfiles"
ARG KCDF_REF="branch/main"
ARG KCDF_SHA="latest"
ARG USER="kamontat"

# Deterministic UID (first user). Helps with docker build cache
ENV USER_ID=1000
# Delete the default ubuntu user & group UID=1000 GID=1000 in Ubuntu 23.04+
# that conflicts with the linuxbrew user
RUN touch /var/mail/ubuntu \
  && chown ubuntu /var/mail/ubuntu \
  && userdel -r ubuntu; true

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  apt update && apt --no-install-recommends install -y gcc git zsh file curl

RUN apt autoremove -y --purge && \
  apt clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "bash" ]
