#!/bin/bash
shopt -s nullglob globstar
prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=("$prefix"/**/*.gpg)
password_files=("${password_files[@]#"$prefix"/}")
password_files=("${password_files[@]%.gpg}")
pass --clip $(printf '%s\n' "${password_files[@]}" | rofi -dmenu -i -p "Pass:") && killall gpg-agent
