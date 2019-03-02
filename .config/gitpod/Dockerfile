FROM ubuntu:18.04

RUN apt update \
    && apt install -y --no-install-recommends \
    sudo \
    curl \
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

# Gitpod adds cacerts?
