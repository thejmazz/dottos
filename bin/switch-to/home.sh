#!/bin/bash

~/.screenlayout/home.sh
bspc monitor DP1 --reset-desktops I II III IV V
bspc monitor eDP1 --reset-desktops VI VII VIII IX X

pkill xfce4-panel
xfce4-panel &
~/startup.sh
