#!/bin/bash

bspc subscribe desktop_add | while read -r action monitor desktop_id desktop_name; do
    # echo Action: $action
    # echo Monitor: $monitor
    # echo desktop_id: $desktop_id
    # echo desktop_name: $desktop_name

    echo "Desktop added: [$desktop_id] $desktop_name"
    ~/.config/bspwm/subscribe/scripts/pager-rows.sh
done &

bspc subscribe desktop_remove | while read -r action monitor_id desktop_id; do
    echo "Desktop removed: [$desktop_id]"
    ~/.config/bspwm/subscribe/scripts/pager-rows.sh
done &

bspc subscribe monitor_add | while read -r monitor_id desktop_id desktop_name; do
    echo "Monitor added: [$monitor_id]"
    ~/.config/bspwm/subscribe/scripts/pager-rows.sh
done &

bspc subscribe monitor_remove | while read -r monitor_id desktop_id; do
    echo "Monitor removed: [$monitor_id]"
    ~/.config/bspwm/subscribe/scripts/pager-rows.sh
done &

