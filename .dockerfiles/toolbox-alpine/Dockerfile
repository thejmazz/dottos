FROM alpine:3.8
MAINTAINER Julian Mazzitelli <mazzitelli.julian@gmail.com>

RUN apk add --update --no-cache sudo shadow && \
    sed -i 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

RUN groupadd --gid 1000 alpine && \
    useradd --uid 1000 --gid alpine --shell /bin/zsh --create-home alpine && \
    usermod -aG wheel alpine

RUN apk add --update --no-cache \
    build-base \
    zsh zsh-vcs \
    tmux \
    curl \
    jq \
    git \
    htop \
    neofetch \
    man man-pages mdocml-apropos less less-doc \
    neovim python2-dev python python3-dev python3 py-pip \
    nodejs npm \
    ruby ruby-dev && \
    pip2 install --upgrade pip && pip3 install --upgrade pip && \
    pip2 install --upgrade neovim && pip3 install --upgrade neovim && \
    npm install -g neovim && \
    gem install neovim || true && \
    apk del build-base ruby-dev

ENV LANG en_US.utf8
ENV PAGER=less
ENV EDITOR=nvim

WORKDIR /home/alpine
USER alpine

RUN curl -fsSL 'https://gist.githubusercontent.com/thejmazz/0960bdaef0a010f6eb0d0dd25e532257/raw/e4a28610af2c73ecbdd255273624e8d7847827ea/bootstrap.sh' | \
    bash -s https://github.com/thejmazz/dottos.git

CMD /bin/zsh
