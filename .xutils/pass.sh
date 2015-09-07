#!/bin/bash
pass --clip $(pass ls | tail -n +2 | rev | cut -f1 -d' ' | rev | rofi -dmenu -i -p "Pass:") && killall gpg-agent
