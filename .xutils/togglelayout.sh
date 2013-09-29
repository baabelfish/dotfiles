#!/bin/bash

setxkbmap -option caps:escape

if [[ -e ~/.xutils/.lock_colemack ]]; then
    rm ~/.xutils/.lock_colemack
    notify-send -t 3 "Layout: colemak"
    xmodmap ~/.xbcolemak
else
    touch ~/.xutils/.lock_colemack
    notify-send -t 3 "Layout: qwerty"
    xmodmap ~/.xbqwerty
fi
