#!/bin/bash

# needs jq, xprop, xseticon

bspc subscribe node_add | while read -r action monitor desktop ip_id node_id; do
    # echo Action: $action
    # echo Monitor: $monitor
    # echo Desktop: $desktop
    # echo ip_id: $ip_id
    # echo node_id $node_id

    className=$(bspc query -T -n $node_id | jq -r '.client.className')
    wm_name=$(xprop -id $node_id WM_NAME)

    [[ "$className" == "konsole" ]] && xseticon -id $node_id ~/icons/terminal.png
    [[ "$className" == "Alacritty" ]] && xseticon -id $node_id ~/icons/terminal.png
    [[ "$className" == "Firefox Developer Edition" ]] && xseticon -id $node_id ~/icons/firefox-developer-icon.png

    echo $wm_name | grep 'Google Play Music' && xseticon -id $node_id ~/icons/google-play-music-alt-01.png
    echo $wm_name | grep 'Google Keep' && xseticon -id $node_id ~/icons/google-keep.png
done
