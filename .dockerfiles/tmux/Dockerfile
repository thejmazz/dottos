# FROM ubuntu:16.04 as build
FROM ubuntu:18.04 as build

ARG VERSION
ENV VERSION ${VERSION:-2.8}

RUN apt update && apt install -y --no-install-recommends \
    git \
    ca-certificates \
    build-essential \
    libevent-dev \
    libncurses-dev \
    autotools-dev automake autoconf pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/tmux/tmux.git /usr/local/src/tmux && \
    cd /usr/local/src/tmux && \
    git checkout $VERSION && \
    sh autogen.sh && \
    ./configure && \
    make && \
    make install

# FROM ubuntu:16.08

# COPY --from=build /usr/local/bin/tmux /usr/local/bin/tmux
# COPY --from=build /usr/local/share/man/man1/tmux.1 /usr/local/share/man/man1/tmux.1
# RUN apt update && apt install -y --no-install-recommends \
#     libevent-2.0-5 \
#     libncurses5 \
#     && rm -rf /var/lib/apt/lists/*
