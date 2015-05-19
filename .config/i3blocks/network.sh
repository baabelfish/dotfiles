#!/bin/sh
CONNECTION=$(nmcli d|grep connected|awk '{print $4}')

if [[ "$CONNECTION" != "--" ]]; then
    TYPE=$(nmcli d|grep connected|awk '{print $2}')
    MARK='-'

    if [[ "$TYPE" == "wifi" ]]; then
        MARK='∿'
    fi
    echo " $MARK $CONNECTION "
fi
