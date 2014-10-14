#!/bin/bash

COM=$(acpi)
COM="$(echo $COM | cut -f2- -d':')"
DIRECTION=$(echo "$COM" | awk '{print $1}')
PERCENT=$(echo "$COM" | awk '{print $2}' | cut -f1 -d',')
TIME=$(echo "$COM" | awk '{print $3}')

if [[ -n "$PERCENT" ]]; then
    if [[ "$DIRECTION" == "Discharging," ]]; then
        echo -n "↓ "
    else
        echo -n "↑ "
    fi
    if [[ -n "${TIME}" ]]; then
        echo "${PERCENT} (${TIME})"
    else
        echo "${PERCENT}"
    fi
fi
