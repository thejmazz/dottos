FROM ubuntu:18.04

RUN apt update \
    && apt install -y --no-install-recommends \
    sudo \
    curl \
    ca-certificates \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/*

# Both username 'gitpod' and uid 33333 appear to be required
RUN useradd \
    # --no-log-init \
    --uid 33333 \
    --groups sudo \
    --create-home \
    --home-dir /home/gitpod \
    --shell /bin/bash \
    gitpod \
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

# env as well? arg?
# TODO verify sha256sum
LABEL nix_version=2.2.1
RUN mkdir /opt/nix \
    && curl -fsSL nixos.org/releases/nix/nix-2.2.1/install -o /opt/nix/install-nix-2.2.1 \
    && curl -fsSL nixos.org/releases/nix/nix-2.2.1/install.asc -o /opt/nix/install-nix-2.2.1.asc \
    && gpg2 --recv-keys B541D55301270E0BCF15CA5D8170B4726D7198DE \
    && gpg2 --verify /opt/nix/install-nix-2.2.1.asc

USER gitpod
ENV USER gitpod
RUN sh /opt/nix/install-nix-2.2.1


USER root

# Gitpod layer adds cacerts?
