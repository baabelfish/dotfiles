#!/bin/bash

if [[ ! -x $HOME/.local/bin/lemonbar ]]; then
    cd /tmp
    git clone https://github.com/krypt-n/bar
    cd bar
    make
    cp lemonbar $HOME/.local/bin
fi

while true; do $HOME/.xutils/barconfig.sh && sleep 1; done | 
 lemonbar -o 1 -p -b -B#00000000 -F#A0A0A0 -f "tewi-8"\
 | bash

#  lemonbar -o 1 -p -b -B#00000000 -F#A0A0A0 -f "Literation Mono Powerline PNFT-8"\
