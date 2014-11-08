#!/bin/sh
TOTAL=$(wicd-cli --wireless -d)

if [[ -n "$TOTAL" ]]; then
    IP=$(echo "$TOTAL" | grep '^IP:' | cut -f2- -d' ')
    ESSID=$(echo "$TOTAL" | grep '^Essid:' | cut -f2- -d' ')
    QUALITY=$(echo "$TOTAL" | grep '^Quality:' | cut -f2- -d' ')
    echo " ∿ $ESSID ($IP) "
else
    TOTAL=$(wicd-cli --wired -d)
    echo " - $IP "
fi
