#!/bin/bash

tmux join-pane $1 -t $2
tmux switch-client -t $2
