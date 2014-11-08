#!/bin/bash
if [[ "$BLOCK_BUTTON" == 1 ]]; then
    urxvtc -geometry 78x36 --hold -title float -e cal -m -y -w
fi

date +" %a %d %b %H:%M:%S "
