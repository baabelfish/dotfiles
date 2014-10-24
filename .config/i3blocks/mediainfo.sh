#!/bin/sh
STATUS="$(playerctl status)"

if [[ $STATUS != "" ]]; then
    ARTIST="$(playerctl metadata artist)"
    ALBUM="$(playerctl metadata album)"
    TRACK="$(playerctl metadata title)"

    echo -n "$ARTIST - $TRACK"
    if [[ $STATUS == "Playing" ]]; then
        echo " (►)"
    elif [[ $STATUS == "Paused" ]]; then
        echo " (Paused)"
    fi
fi

