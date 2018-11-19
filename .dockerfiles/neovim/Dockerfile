FROM ubuntu:16.04 as build

ARG VERSION
ENV VERSION ${VERSION:-v0.3.1}

# https://github.com/neovim/neovim/wiki/Building-Neovim

RUN apt update && apt install -y --no-install-recommends \
    git \
    ca-certificates \
    curl \
    ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/neovim/neovim.git /usr/local/src/neovim && \
    cd /usr/local/src/neovim && \
    git checkout $VERSION && \
    make CMAKE_BUILD_TYPE=Release && \
    make install

FROM ubuntu:16.04

COPY --from=build /usr/local/bin/nvim /usr/local/bin/nvim
COPY --from=build /usr/local/man/man1/nvim.1 /usr/local/man/man1/nvim.1
COPY --from=build /usr/local/share/nvim /usr/local/share/nvim
COPY --from=build /usr/local/share/locale/* /usr/local/share/locale/
