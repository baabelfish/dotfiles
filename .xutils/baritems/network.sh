#!/bin/sh
CONNECTION=$(nmcli d|grep connected|awk '{print $4}')

if [[ "$CONNECTION" != "--" ]]; then
    echo " $CONNECTION"
fi
