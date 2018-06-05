#!/bin/sh

xrandr \
    --output VIRTUAL1 --off \
    --output eDP1 --primary --mode 1440x900 --pos 1280x0 --rotate normal \
    --output DP1 --mode 1280x1024 --pos 0x0 --rotate normal \
    --output DP2 --off \
    --output HDMI2 --off \
    --output HDMI1 --off \
    --output VGA1 --off
