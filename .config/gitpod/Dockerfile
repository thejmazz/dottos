#################
# ANSIBLE-BUILD #
#################

FROM ubuntu:18.04 as build_ansible

RUN apt update \
    && apt install -y --no-install-recommends \
    python3 python3-dev python3-venv \
    build-essential \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/venvs/ansible \
    && sh -c ". /opt/venvs/ansible/bin/activate && pip install ansible==2.7.5"

###########
# CONSOLE #
###########

FROM ubuntu:18.04 as console

# Need 'python' install of 'python-minimal' for tmux to succeed (cannot find module 'zipfile')
# TODO locale
RUN apt update \
    && apt install -y --no-install-recommends \
    sudo \
    curl \
    git \
    ca-certificates \
    gnupg2 \
    python3 \
    python \
    # python-minimal \
    man \
    htop \
    && rm -rf /var/lib/apt/lists/*

# Both username 'gitpod' and uid 33333 appear to be required
# sudo will work but depends on capabilities of container
RUN useradd \
    # --no-log-init \
    --uid 33333 \
    --groups sudo \
    --create-home \
    --home-dir /home/gitpod \
    --shell /bin/bash \
    gitpod \
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

COPY --from=build_ansible /opt/venvs/ansible /opt/venvs/ansible
RUN mkdir -p /usr/local/src/github.com/thejmazz \
    && git clone https://github.com/thejmazz/dottos.git /usr/local/src/github.com/thejmazz/dottos

WORKDIR /usr/local/src/github.com/thejmazz/dottos/.config/ansible
# yadm
RUN mkdir /usr/local/share/man/man1 \
    && sh -c ". /opt/venvs/ansible/bin/activate && ansible --connection=local -i \"127.0.0.1,\" all -m include_role -a name=yadm"

USER gitpod

RUN yadm clone https://github.com/thejmazz/dottos.git

WORKDIR /home/gitpod/.config/ansible

# tmux
RUN sh -c ". /opt/venvs/ansible/bin/activate && ansible --become --connection=local -i \"127.0.0.1,\" all -m include_role -a name=tmux --extra-vars tpm_users=gitpod"

# zsh
RUN sh -c ". /opt/venvs/ansible/bin/activate && ansible --become --connection=local -i \"127.0.0.1,\" all -m include_role -a name=zsh --extra-vars zsh_users=gitpod"

# neovim
RUN sh -c ". /opt/venvs/ansible/bin/activate && ansible --become --connection=local -i \"127.0.0.1,\" all -m include_role -a name=neovim --extra-vars neovim_users=gitpod"

# neovim
# RUN sh -c ". /opt/venvs/ansible/bin/activate && ansible --connection=local -i \"127.0.0.1,\" all -m include_role -a name=neovim --extra-vars '\
# neovim_users: [ \"root\", \"gitpod\" ] \
# '"

# TODO zsh

# TODO clone most recent dotfiles

# env as well? arg?
# TODO verify sha256sum
# LABEL nix_version=2.2.1
# RUN mkdir /opt/nix \
#     && curl -fsSL nixos.org/releases/nix/nix-2.2.1/install -o /opt/nix/install-nix-2.2.1 \
#     && curl -fsSL nixos.org/releases/nix/nix-2.2.1/install.asc -o /opt/nix/install-nix-2.2.1.asc \
#     && gpg2 --recv-keys B541D55301270E0BCF15CA5D8170B4726D7198DE \
#     && gpg2 --verify /opt/nix/install-nix-2.2.1.asc

# USER gitpod
# ENV USER gitpod
# RUN sh /opt/nix/install-nix-2.2.1

WORKDIR /home/gitpod
USER root

# Gitpod layer adds cacerts?
