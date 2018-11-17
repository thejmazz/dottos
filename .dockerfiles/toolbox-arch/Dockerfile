FROM base/archlinux:latest
# 2gb vs 600mb...
# FROM base/devel:latest
MAINTAINER Julian Mazzitelli <mazzitelli.julian@gmail.com>

RUN sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen

RUN pacman -Syu --noconfirm && pacman -S --noconfirm sudo && \
    sed -i 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

RUN groupadd --gid 1000 arch && \
    useradd --uid 1000 --gid arch --shell /bin/zsh --create-home arch && \
    usermod -aG wheel arch

RUN pacman -Syu --noconfirm && pacman -S --noconfirm \
    # tools
    zsh \
    tmux \
    curl \
    jq \
    git \
    htop \
    neofetch \
    man \
    go \
    gcc fakeroot \
    # neovim, todo use aur ruby-neovim
    neovim python2-neovim python-neovim nodejs npm && \
    npm install -g neovim

ENV LANG en_US.utf8
ENV PAGER=less
ENV EDITOR=nvim

WORKDIR /home/arch
USER arch

RUN go get -u github.com/jguer/yay && \
    /home/arch/go/bin/yay -S --noconfirm ruby-neovim

RUN curl -fsSL 'https://gist.githubusercontent.com/thejmazz/0960bdaef0a010f6eb0d0dd25e532257/raw/e4a28610af2c73ecbdd255273624e8d7847827ea/bootstrap.sh' | \
    bash -s https://github.com/thejmazz/dottos.git

CMD /bin/zsh
