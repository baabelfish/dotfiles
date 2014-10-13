#!/bin/bash
if [[ "$BLOCK_BUTTON" == 1 ]]; then
    urxvtc -geometry 69x36 --hold -title float -e cal -m -y
fi

date +"%a %d %b %H:%M:%S"
