#!/bin/bash
IFS=$'\n'

lpass ls
[[ $? != "0" ]] && notify-send "User not logged in" && exit 1
data=($(lpass show --color=never $(lpass ls --color=never | rofi -dmenu -i -p "» " | sed -rn 's/^.* \[id: (.*)\]/\1/p')))
[[ $? != "0" ]] && exit 1
if [[ ! -e "$data" ]]; then
    service=$(echo ${data[0]} | sed -rn 's/^(.*) \[.*/\1/p')
    username=$(echo ${data[1]} | sed -rn 's/^.*: (.*)/\1/p')
    password=$(echo ${data[2]} | sed -rn 's/^.*: (.*)/\1/p')
    notify-send "Password for $username@$service stored to clipboard"
    echo -n $password | xclip
    sleep 10 && echo -n "" | xclip
fi
