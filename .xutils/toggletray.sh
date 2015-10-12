#!/bin/bash

if pgrep stalonetray > /dev/null
then
    killall stalonetray
else
    stalonetray&
fi
