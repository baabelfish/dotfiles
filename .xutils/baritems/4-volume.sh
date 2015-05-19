#!/bin/bash
if ponymix is-muted; then
    MODIFIER="(muted)"
    echo "^fg(#fa7)$(ponymix get-volume)%"
else
    echo "^fg(#b85)(Muted)"
fi
