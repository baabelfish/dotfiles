#!/bin/bash

IFS=$'\n'

declare -A commands
commands["l: chrome"]="google-chrome-stable"
commands["l: netbeans"]="netbeans"
commands["l: spotify"]="spotify"
commands["c: fish"]="termite -t float -e nvim ~/.config/fish/config.fish"
commands["c: i3  "]="termite -t float -e nvim ~/.i3/config"
commands["c: nvim"]="termite -t float -e nvim ~/.config/nvim/init.vim"

command=$(for key in ${!commands[@]}; do
  echo $key
done\
  |rofi -dmenu $dmenu_flags -p "Launch:" -fn $dmenu_font -i -nb $dmenu_bg -nf $dmenu_fg -sb $dmenu_bg_selected -sf $dmenu_fg_selected)

com_eval=${commands[$command]}
bash -c $com_eval
