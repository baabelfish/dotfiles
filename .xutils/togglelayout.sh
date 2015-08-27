#!/bin/bash

setxkbmap -option caps:escape

if [[ -e ~/.xutils/.lock_colemack ]]; then
    rm ~/.xutils/.lock_colemack
    notify-send -t 3 "Layout: colemak"
    xmodmap ~/.xbworkman
else
    touch ~/.xutils/.lock_colemack
    notify-send -t 3 "Layout: workman"
    xmodmap ~/.xbqwerty
fi
