#!/bin/bash

COM=$(acpi)
PERCENT=$(echo "$COM" | awk '{print $2}' | cut -f1 -d',')
TIME=$(echo "$COM" | awk '{print $3}')

if [[ -n "$PERCENT" ]]; then
    echo -n "⌁ "
    echo -n "${PERCENT}"
    if [[ -n "${TIME}" ]]; then
        echo " (${TIME})"
    fi
fi
