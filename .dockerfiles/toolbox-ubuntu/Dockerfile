FROM ubuntu:18.04
MAINTAINER Julian Mazzitelli <mazzitelli.julian@gmail.com>

# Install sudo and enable passwordless sudo for group sudo
RUN apt update -y && apt install -y --no-install-recommends sudo && \
    sed -i 's/%sudo   ALL=(ALL:ALL) ALL/%sudo   ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

RUN groupadd --gid 1000 ubuntu && \
    useradd --uid 1000 --gid ubuntu --shell /bin/zsh --create-home ubuntu && \
    usermod -aG sudo ubuntu

RUN apt update -y && \
    apt install -y --no-install-recommends software-properties-common && \
    apt-add-repository ppa:neovim-ppa/stable -y && \
    apt update -y && apt install -y --no-install-recommends \
    dnsutils \
    # tools
    zsh \
    tmux \
    curl \
    jq \
    git \
    htop \
    neofetch \
    gnupg2 \
    telnet \
    neovim python-dev python-pip python3-dev python3-pip python-setuptools python3-setuptools && \
    pip2 install --upgrade neovim && pip3 install --upgrade neovim && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt install -y --no-install-recommends nodejs && \
    npm install -g neovim && \
    rm -rf /var/lib/apt/lists/*

ENV LANG en_US.utf8
ENV PAGER=less
ENV EDITOR=nvim

WORKDIR /home/ubuntu
# USER ubuntu

RUN curl -fsSL 'https://gist.githubusercontent.com/thejmazz/0960bdaef0a010f6eb0d0dd25e532257/raw/e4a28610af2c73ecbdd255273624e8d7847827ea/bootstrap.sh' | \
    bash -s https://github.com/thejmazz/dottos.git

CMD /bin/zsh
