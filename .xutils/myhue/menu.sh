#!/bin/bash
lights=$(curl \
    -s \
    --connect-timeout 10 \
    -H 'Content-Type: application/json;charset=UTF-8' \
    -H "x-token: $MY_HUE_LIGHTS" \
    "https://client-eastwood-dot-hue-prod-us.appspot.com/api/0/lights")

IFS="
"
formatted_lights=($(echo "$lights"|jq -M '.[] | { name: .name, on: .state.on, bri: .state.bri, hue: .state.hue, sat: .state.sat } | @text "\(.name)@[\(.on), bri: \(.bri), sat: \(.sat), hue: \(.hue)]"' | tr -d '\"' | column -t -s @ | tr -d '@'))
count=1
menustr=""
for light in ${formatted_lights[@]}; do
    menustr="${menustr}${count} - ${light}\n"
    count=$(($count + 1))
done
light_id=$(echo -e $menustr|rofi -dmenu|awk '{print $1}')

command=$(echo -e "\
on
off
alert
"|rofi -dmenu|cut -f2 -d "	")

~/.xutils/myhue/command.sh $light_id "$command"
