#!/bin/bash

monitor_ids=$(bspc query -M)

for m in $monitor_ids
do
    names=$(bspc query -T -m $m | jq -r '.desktops | .[] | .name')
    if [[ $names == "Desktop" ]]
    then
        bspc monitor $m --remove
    fi
done
