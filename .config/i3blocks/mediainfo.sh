#!/bin/sh
STATUS="$(playerctl status)"

if [[ $STATUS != "" ]]; then
    ARTIST="$(playerctl metadata artist)"
    ALBUM="$(playerctl metadata album | cut -d'(' -f1)"
    TRACK="$(playerctl metadata title | cut -d'(' -f1)"
    STR="$(echo "$ARTIST - $TRACK" | sed -e 's/^ *//' | sed -e 's/ *$//' | cut -c 1-50)"

    echo -n "$STR"
    if [[ $STATUS == "Playing" ]]; then
        echo " (►)"
    elif [[ $STATUS == "Paused" ]]; then
        echo " (Paused)"
    fi
fi

