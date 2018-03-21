#!/bin/bash

direction=$1

property="/plugins/plugin-2/rows"
current_rows=$(xfconf-query -c xfce4-panel -p $property)

desktops=$(bspc query -D)
current_desktop=$(bspc query -D -d)

total=$(bspc query -D | wc -l)
width=$(( $total / $current_rows ))

i=0
current_index=-1
while read line; do
    [[ $line = $(bspc query -D -d) ]] && current_index=$i
    i=$(( $i + 1 ))
done < <(bspc query -D)

echo current_index: $current_index

# TODO handle rollover
wanted_index=$current_index
if [[ $direction == "down" ]]; then
    temp=$(( $current_index + $width ))
    [[ $temp -le $total ]] && wanted_index=$(( $current_index + $width ))
elif [[ $direction == "up" ]]; then
    [[ $current_index > $width ]] && wanted_index=$(( $current_index - $width ))
fi

echo wanted_index: $wanted_index

wanted_id=$current_desktop
i=0
current_index=-1
while read line; do
    [[ $i = $wanted_index ]] && wanted_id=$line
    i=$(( $i + 1 ))
done < <(bspc query -D)

echo wanted_id: $wanted_id

bspc desktop --focus $wanted_id


