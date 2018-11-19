FROM ubuntu:16.04

# ARG TMUX_VERSION
# ENV TMUX_VERSION ${TMUX_VERSION:-2.8}

# FROM local-tmux:2.8 as tmux

# TODO template this
FROM ubuntu:16.04 as build

# sudo and user
RUN apt update && apt install -y --no-install-recommends sudo && \
    # replace on tab and spaces
    sed -i 's/%sudo   ALL=(ALL:ALL) ALL/%sudo   ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers && \
    sed -i 's/%sudo\tALL=(ALL:ALL) ALL/%sudo   ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers && \
    groupadd --gid 1000 ubuntu && \
    useradd --uid 1000 --gid ubuntu --shell /bin/bash --create-home ubuntu && \
    usermod -aG sudo ubuntu

# Utilities
RUN apt update && apt install -y --no-install-recommends \
    curl \
    ca-certificates \
    git \
    dnsutils \
    telnet \
    zsh \
    jq \
    htop \
    man \
    less \
    netcat \
    && rm -rf /var/lib/apt/lists/*

# SSH
RUN apt update && apt install -y --no-install-recommends \
    openssh-server \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /var/run/sshd \
    && echo 'ubuntu:password' | chpasswd

# TODO template source repo

# Butterfly
# COPY --from=gcr.io/biobox-dev/butterfly:3.2.5 /venvs/butterfly /venvs/butterfly
# RUN ln -s /venvs/butterfly/bin/butterfly /usr/local/bin/butterfly && \
#     ln -s /venvs/butterfly/bin/butterfly.server.py /usr/local/bin/butterfly.server.py
# RUN apt update && apt install -y --no-install-recommends \
#     python3 \
#     libexpat-dev \
#     && rm -rf /var/lib/apt/lists/*

# Cloudflared
# COPY --from=gcr.io/biobox-dev/cloudflared:2018.10.4 /cloudflared /usr/local/bin/cloudflared

# Tmux
ARG TMUX_VERSION
ENV TMUX_VERSION ${TMUX_VERSION:-2.8}

# FROM local-tmux:2.8 as tmux
COPY --from=local-tmux:2.8 /usr/local/bin/tmux /usr/local/bin/tmux
COPY --from=local-tmux:2.8 /usr/local/man/man1/tmux.1 /usr/local/man/man1/tmux.1
RUN apt update && apt install -y --no-install-recommends \
    libevent-2.0-5 \
    libncurses5 \
    && rm -rf /var/lib/apt/lists/*

# kr
# RUN apt update && \
#     curl https://krypt.co/kr | sh

# Neovim
COPY --from=local-neovim:v0.3.1 /usr/local/bin/nvim /usr/local/bin/nvim
COPY --from=local-neovim:v0.3.1 /usr/local/man/man1/nvim.1 /usr/local/man/man1/nvim.1
COPY --from=local-neovim:v0.3.1 /usr/local/share/nvim /usr/local/share/nvim
COPY --from=local-neovim:v0.3.1 /usr/local/share/locale/* /usr/local/share/locale/

# Neofetch
# RUN git clone https://github.com/dylanaraps/neofetch /usr/local/src/neofetch && \
#     cd /usr/local/src/neofetch && \
#     git checkout 5.0.0 && \
#     make install && \
#     rm -rf /usr/local/src/neofetch

# NVM
# RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Zsh
# RUN curl -sL git.io/antibody | sh -s
# ADD --chown=ubuntu:ubuntu zshrc /home/ubuntu/.zshrc

# ENV PAGER less
# ENV EDITOR nvim
WORKDIR /home/ubuntu
USER ubuntu

# for drone...
# https://www.reddit.com/r/droneci/comments/8opfxw/build_using_docker_image_with_user_directive/
# USER root
