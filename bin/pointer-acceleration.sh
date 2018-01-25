#!/bin/bash

id=$(xinput | grep "USB Optical Mouse" | sed -e 's/.*id=\([0-9]\+\).*$/\1/')

xinput --set-prop $id 'libinput Accel Speed' $1

xinput --list-props $id
