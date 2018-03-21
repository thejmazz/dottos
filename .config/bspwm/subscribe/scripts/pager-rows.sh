#!/bin/bash

property="/plugins/plugin-2/rows"

# number of desktops
n=$(bspc query -D | wc -l)

# current number of rows
current_rows=$(xfconf-query -c xfce4-panel -p $property)

rows=1
# [[ $n -le 3 ]] && rows=1
[[ $n -gt 3 && $n -le 10 ]] && rows=2
[[ $n -gt 10 ]] && rows=3

echo $rows

if [ $current_rows = $rows ]
then
    echo "nothing to change"
else
    echo "setting rows to: $rows"
    xfconf-query -c xfce4-panel -p /plugins/plugin-2/rows -s $rows
fi

