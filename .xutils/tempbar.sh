#!/bin/bash

if pgrep lemonbar > /dev/null
then
    killall stalonetray
    killall bar.sh
    killall lemonbar
else
    $HOME/.xutils/bar.sh&
    stalonetray&
fi
