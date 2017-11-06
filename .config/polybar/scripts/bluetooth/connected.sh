#!/bin/bash

headset_connected=$(~/.config/polybar/scripts/bluetooth/info.js | grep Connected | awk '{print $2}')

if [ $headset_connected == 'no' ]; then
    echo 
else
    echo  Monster Clarity
fi
