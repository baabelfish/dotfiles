#!/bin/bash
if ponymix is-muted; then
    echo -n " ✖ "
else
    echo -n " ♫ "
fi

ponymix get-volume | tr -d '\n'
echo "% "
