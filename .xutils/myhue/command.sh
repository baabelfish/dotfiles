#!/bin/bash

option="$3"
if [[ -z "$option" ]]; then
    option=1
fi

declare -A commands
commands[on]="{\"on\": true}"
commands[off]="{\"on\": false}"
commands[alert]="{\"alert\": \"select\"}"
commands[alarm]="{\"alert\": \"lselect\"}"
commands[bri]="{\"bri\": $option}"
commands[hue]="{\"hue\": $(($option*65535/255))}"
commands[sat]="{\"sat\": $option}"
commands[effect]="{\"effect\": \"$option\"}"
commands[delay]="{\"transitiontime\": $option}"
selected_command="${commands[$2]}"

if [[ -z "$selected_command" ]]; then
    echo "./command.sh <light_id> <command> [parameters...]"
    echo "Example: ./command.sh 1 on"
    echo ""
    echo "Available options:"
    echo "on"
    echo "off"
    echo "bri"
    echo "hue"
    echo "sat"
    echo "alert"
    echo "alarm"
else
    ~/.xutils/myhue/raw_command.sh "$1" "$selected_command"&
fi
