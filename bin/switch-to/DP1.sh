#!/bin/bash

~/.screenlayout/only-DP1.sh
bspc monitor eDP1 --remove
bspc monitor DP1 --reset-desktops I II III IV V VI VII VIII IX X
bspc wm --adopt-orphans
bspc config -m DP1 top_padding 52
pkill xfce4-panel
xfce4-panel &
~/startup.sh 202
