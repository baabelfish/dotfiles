#!/bin/bash

IFS=$'\n'

run_or_focus() {

}

declare -A commands
commands["chrome"]="google-chrome-stable"
commands["netbeans"]="netbeans"
commands["spotify"]="spotify"
commands["fish"]="termite -t float -e nvim ~/.config/fish/config.fish"
commands["i3"]="termite -t float -e nvim ~/.i3/config"
commands["nvim"]="termite -t float -e nvim ~/.config/nvim/init.vim"

command=$(for key in ${!commands[@]}; do
  echo $key
done\
  |rofi -dmenu $dmenu_flags -p "Launch:" -fn $dmenu_font -i -nb $dmenu_bg -nf $dmenu_fg -sb $dmenu_bg_selected -sf $dmenu_fg_selected)

com_eval=${commands[$command]}
bash -c $com_eval
