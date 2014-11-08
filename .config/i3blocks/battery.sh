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

if [[ -n "$PERCENT" ]]; then
    if [[ "$DIRECTION" == "Discharging," ]]; then
        if [[ $PERCENTNUMBER -lt 15 ]]; then
            DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
            if [[ "$PERCENTNUMBER" -lt 9 ]]; then
                systemctl suspend
            elif [[ "$PERCENTNUMBER" -lt 12 ]]; then
                $DIR/notification.sh urgent "✘ Going to suspend now... Seriously!"
            elif [[ "$PERCENTNUMBER" -lt 15 ]]; then
                $DIR/notification.sh urgent "✘ Going to suspend now..."
            else
                $DIR/notification.sh warning "⚠ Battery is low"
            fi
        fi
        echo -n " ☇ "
    else
        echo -n " ☈ "
    fi

    if [[ -n "${TIME}" ]]; then
        echo "${PERCENT} (${TIME}) "
    else
        echo "${PERCENT} "
    fi
fi
