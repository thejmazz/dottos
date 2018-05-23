#!/bin/sh

# pkill xfce4-panel
# nohup xfce4-panel &

pkill plank
nohup plank &

# sleep 5

export PRIMARY_MONITOR=$(xrandr | grep primary | awk '{print $1}')
export SECONDARY_MONITOR=$(xrandr | grep " connected" | grep -v primary | awk '{print $1}')

XFCE4_PANEL_ID=$(xwininfo -tree -root | grep xfce4-panel | grep -v "10x10+10+10" | awk '{print $1}')
XFCE4_PANEL_GEOMETRY=$(xwininfo -id $XFCE4_PANEL_ID | grep geometry | awk '{print $2}')
export XFCE4_PANEL_WIDTH=$(echo $XFCE4_PANEL_GEOMETRY | cut -d 'x' -f1)
echo XFCE4_PANEL_WIDTH via xwininfo: $XFCE4_PANEL_WIDTH

# replace if passed in
[[ -n $1 ]] && export XFCE4_PANEL_WIDTH=$1

export XFCE4_PANEL_WIDTH=$(( $XFCE4_PANEL_WIDTH - 2 ))
echo XFCE4_PANEL_WIDTH: $XFCE4_PANEL_WIDTH

# sed -e 's/.*\ \([0-9]\+\)x\([0-9]\+\)+\([0-9]\+\)+\([0-9]\+\).*/\1,\2,\3,\4/'

PRIMARY_MONITOR_WIDTH=$(xrandr | grep primary | sed 's/.*\ \([0-9]\+\)x\([0-9]\+\)+\([0-9]\+\)+\([0-9]\+\).*/\1/')
echo PRIMARY_MONITOR_WIDTH: $PRIMARY_MONITOR_WIDTH

export PRIMARY_BAR_WIDTH=$(( $PRIMARY_MONITOR_WIDTH - $XFCE4_PANEL_WIDTH ))
echo PRIMARY_BAR_WIDTH: $PRIMARY_BAR_WIDTH

~/.config/polybar/launch.sh
