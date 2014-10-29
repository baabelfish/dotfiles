#!/bin/sh

LEVEL="$1"

shift
MESSAGE="$*"

getNotification() {
    local FILENAME="$HOME/.cache/notification-"$LEVEL
    if [[ -e $FILENAME ]]; then
        if [[ "$(wc -l $FILENAME | cut -f1 -d' ')" -gt 0 ]]; then
            head -n 1 $FILENAME
            echo "$(tail -n +2 $FILENAME)" > $FILENAME
        fi
    fi
}

pushNotification() {
    local FILENAME="$HOME/.cache/notification-"$LEVEL
    echo $MESSAGE >> $FILENAME
}

if [[ -n $MESSAGE ]]; then
    if [[ $LEVEL == "success" ]]; then
        pushNotification
    elif [[ $LEVEL == "normal" ]]; then
        pushNotification
    elif [[ $LEVEL == "warning" ]]; then
        pushNotification
    elif [[ $LEVEL == "urgent" ]]; then
        pushNotification
    fi
else
    if [[ $LEVEL == "success" ]]; then
        getNotification
    elif [[ $LEVEL == "normal" ]]; then
        getNotification
    elif [[ $LEVEL == "warning" ]]; then
        getNotification
    elif [[ $LEVEL == "urgent" ]]; then
        getNotification
    fi
fi
