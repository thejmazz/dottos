#!/bin/bash

#exit 0

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

/usr/bin/xrandr --current | grep -E '^DP1 connected'
if [ $? -eq 0 ]; then
  echo "DPI found, disabling eDPI"
  sleep 1s 
  /usr/bin/xrandr --output eDP1 --off
  /usr/bin/xrandr --output DP1 --auto --primary
fi
