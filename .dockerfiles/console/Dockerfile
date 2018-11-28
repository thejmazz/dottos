FROM ubuntu:18.04

# ARG TMUX_VERSION
# ENV TMUX_VERSION ${TMUX_VERSION:-2.8}

# FROM local-tmux:2.8 as tmux

# TODO template this
# FROM ubuntu:16.04 as build

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
    wget \
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

# VNC
# RUN apt update && apt install -y --no-install-recommends \
#     wget \
#     && rm -rf /var/lib/apt/lists/*
# RUN wget -qO- https://dl.bintray.com/tigervnc/stable/tigervnc-1.8.0.x86_64.tar.gz | tar xz --strip 1 -C /



ARG TURBOVNC_VERSION=2.1.2
ARG VIRTUALGL_VERSION=2.5.2

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gcc \
        libc6-dev \
        # libglu1 \
        libglu1-mesa \
        # libglu1:i386 \
        libsm6 \
        libxv1 \
        # libxv1:i386 \
        make \
        python \
        python-numpy \
        x11-xkb-utils \
        xauth \
        xfonts-base \
        xkb-data && \
    rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
    curl -fsSL -O https://svwh.dl.sourceforge.net/project/turbovnc/${TURBOVNC_VERSION}/turbovnc_${TURBOVNC_VERSION}_amd64.deb \
        -O https://svwh.dl.sourceforge.net/project/virtualgl/${VIRTUALGL_VERSION}/virtualgl_${VIRTUALGL_VERSION}_amd64.deb \
        -O https://svwh.dl.sourceforge.net/project/virtualgl/${VIRTUALGL_VERSION}/virtualgl32_${VIRTUALGL_VERSION}_amd64.deb && \
    dpkg -i *.deb && \
    rm -f /tmp/*.deb && \
    sed -i 's/$host:/unix:/g' /opt/TurboVNC/bin/vncserver

ENV PATH ${PATH}:/opt/VirtualGL/bin:/opt/TurboVNC/bin

RUN apt update && apt install -y --no-install-recommends \
    xterm \
    firefox \
    konsole \
    xorg \
    && rm -rf /var/lib/apt/lists/*
    # tightvncserver

ENV USER ubuntu
COPY --chown=ubuntu:ubuntu xstartup /home/ubuntu/.vnc/xstartup

# noVNC
ARG WEBSOCKIFY_VERSION=0.8.0
ARG NOVNC_VERSION=1.0.0-beta
RUN curl -fsSL https://github.com/novnc/noVNC/archive/v${NOVNC_VERSION}.tar.gz | tar -xzf - -C /opt && \
    curl -fsSL https://github.com/novnc/websockify/archive/v${WEBSOCKIFY_VERSION}.tar.gz | tar -xzf - -C /opt && \
    mv /opt/noVNC-${NOVNC_VERSION} /opt/noVNC && \
    mv /opt/websockify-${WEBSOCKIFY_VERSION} /opt/websockify && \
    ln -s /opt/noVNC/vnc_lite.html /opt/noVNC/index.html && \
    cd /opt/websockify && make


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
    # libevent-2.0-5 \
    libevent-2.1-6 \
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

# BSPWM
RUN apt update && apt install -y --no-install-recommends \
    xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev \
    gcc make build-essential \
    && rm -rf /var/lib/apt/lists/*
RUN cd /opt && \
    git clone https://github.com/baskerville/bspwm.git && \
    cd bspwm && \
    make && \
    make install
# SXHKD
RUN cd /opt && \
    git clone https://github.com/baskerville/sxhkd.git && \
    cd sxhkd && \
    make && \
    make install

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
