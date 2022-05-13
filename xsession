#!/usr/bin/bash

xbanish &
xset r rate 200 25

setxkbmap -option shift:both_capslock
xmodmap ~/.xmodmap
xcape -e 'Mode_switch=Escape'
