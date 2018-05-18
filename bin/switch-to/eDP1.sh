#!/bin/bash

~/.screenlayout/only-eDP1.sh
bspc monitor DP1 --remove
bspc monitor eDP1 --reset-desktops I II III IV V VI VII VIII IX X
bspc wm --adopt-orphans
bspc config -m eDP1 top_padding 52
pkill xfce4-panel
xfce4-panel &
~/startup.sh
