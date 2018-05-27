#!/bin/bash

# needs jq and chwb

bspc subscribe node_focus | while read -r action monitor_id desktop_id node_id; do
    # echo Action: $action
    # echo Monitor: $monitor_id
    # echo Desktop: $desktop_id
    # echo node_id $node_id

    className=$(bspc query -T -n $node_id | jq -r '.client.className')

    case "$className" in
        Postman)
            # Sometimes flashes
            chwb -c 0x464646 $node_id
            # Flashes less?
            # bspc config focused_border_color "#464646"
            ;;
        *)
            # Reset to default focused_border_color
            # Not required if using chwb approach
            # bspc config focused_border_color "#dfdfdf"
        esac
done
