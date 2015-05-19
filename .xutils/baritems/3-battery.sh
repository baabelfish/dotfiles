#!/bin/bash
COM=$(acpi)
COM="$(echo $COM | cut -f2- -d':')"
DIRECTION=$(echo "$COM" | awk '{print $1}')
PERCENT=$(echo "$COM" | awk '{print $2}' | cut -f1 -d',')
PERCENTNUMBER=$(echo "$COM" | awk '{print $2}' | cut -f1 -d',' | cut -f1 -d'%')
TIME=$(echo "$COM" | awk '{print $3}')
HOURS=$(echo "$TIME" | cut -f1 -d':')
MINUTES=$(echo "$TIME" | cut -f2 -d':')
SECONDS=$(echo "$TIME" | cut -f3 -d':')
ISLOW=0

PREFIX="^fg(#9400ff)"

if [[ -n "$PERCENT" ]]; then
    STR=$PREFIX
    if [[ -n "${TIME}" ]]; then
        STR+="${PERCENT} (${TIME})"
    else
        STR+="${PERCENT} "
    fi
    echo "$STR"
fi
