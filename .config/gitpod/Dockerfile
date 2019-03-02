# cannot copy over 'gitpod-layer' because debian vs ubuntu?
FROM ubuntu:18.04

RUN apt update \
    && apt install -y --no-install-recommends \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# 33333 hardcoded by Gitpod?
RUN useradd \
    # --no-log-init \
    --uid 33333 \
    --groups sudo \
    --create-home \
    --home-dir /home/gitpod \
    --shell /bin/bash \
    gitpod \
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers
