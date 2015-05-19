#!/bin/sh
STATUS="$(playerctl status)"

if [[ $STATUS != "" ]]; then
    ARTIST="$(playerctl metadata artist)"
    ALBUM="$(playerctl metadata album | cut -d'(' -f1)"
    TRACK="$(playerctl metadata title | cut -d'(' -f1)"
    STR="$(echo "$ARTIST - $TRACK" | sed -e 's/^ *//' | sed -e 's/ *$//' | cut -c 1-50)"

    if [[ $STATUS == "Playing" ]]; then
        echo "^fg(#61edf2)$STR"
    elif [[ $STATUS == "Paused" ]]; then
        echo "^fg(#119dc2)$STR"
    fi
fi

