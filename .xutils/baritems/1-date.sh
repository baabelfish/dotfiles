#!/bin/bash
if [[ "$BLOCK_BUTTON" == 1 ]]; then
    urxvtc -geometry 78x36 --hold -title float -e cal -m -y -w
fi

DATE=$(date +"%A %d-%m-%Y")
TIME=$(date +"%H:%M:%S")

echo "^fg(#229922)$DATE"
echo "^fg(#22ff22)$TIME"
