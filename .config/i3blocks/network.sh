#!/bin/sh
TOTAL=$(wicd-cli --wireless -d)
ESSID=$(echo "$TOTAL" | grep '^Essid:' | cut -f2- -d' ')
QUALITY=$(echo "$TOTAL" | grep '^Quality:' | cut -f2- -d' ')
IP=$(echo "$TOTAL" | grep '^IP:' | cut -f2- -d' ')
echo "$ESSID ($IP)"
