#!/bin/bash
if ponymix is-muted; then
    echo -n " mute";
else
    echo -n "♫ ";
    ponymix get-volume | tr -d '\n';
    echo -n "%";
fi
