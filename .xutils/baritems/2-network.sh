#!/bin/sh
CONNECTION=$(nmcli d|grep connected|awk '{print $4}')

if [[ "$CONNECTION" != "--" ]] && [[ "$CONNECTION" != "Wired" ]]; then
    echo "$CONNECTION"
fi
