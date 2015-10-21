#!/bin/bash
command=$(echo -e "\
on	{\"on\": true}\n\
off	{\"on\": false}\n\
"|rofi -dmenu|cut -f2 -d "	")
echo $command

IFS=', ' read -a selected_lights <<< "$(echo|rofi -dmenu)"
for i in ${selected_lights[@]}; do
    ~/.xutils/myhue/command.sh $i "$command" &
done
