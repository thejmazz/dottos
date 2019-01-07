#!/bin/bash

sudo apt update && sudo apt install -y \
    python3 \
    python3-dev \
    python3-venv \
    build-essential \
    libffi-dev \
    libssl-dev
python3 -m venv ~/.venvs/ansible
source ~/.venvs/ansible/bin/activate && pip install ansible==2.7.5
cd ~/.config/ansible
ansible-playbook --connection=local -i "127.0.0.1," bootstrap.yml
