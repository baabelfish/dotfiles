#!/bin/bash
if ponymix is-muted; then
    echo "^fg(#b85)(Muted)"
else
    MODIFIER="(muted)"
    echo "^fg(#fa7)$(ponymix get-volume)%"
fi
