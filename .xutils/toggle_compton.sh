#!/bin/bash
ISRUNNING=$(pgrep '\<compton\>')
echo $ISRUNNING
if [[ -z $ISRUNNING ]]; then
    echo "Compton: start"
    compton&
else
    echo "Compton: stop"
    killall compton
fi
