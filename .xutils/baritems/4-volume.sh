#!/bin/bash
if ponymix is-muted; then
    MODIFIER="(muted)"
    echo "^fg(#fff)$(ponymix get-volume)%"
else
    echo "^fg(#b85)(Muted)"
fi
