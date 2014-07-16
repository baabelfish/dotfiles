#!/bin/bash
pass --clip $(pass ls | tail -n +2 | rev | cut -f1 -d' ' | rev | dmenu -i -b -p "Pass:") && killall gpg-agent
