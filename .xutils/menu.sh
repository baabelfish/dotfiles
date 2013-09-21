#!/bin/bash
source ~/.xutils/config.sh
dmenu_run $dmenu_flags -p "Launch:" -fn $dmenu_font -i -nb $dmenu_bg -nf $dmenu_fg -sb $dmenu_bg_selected -sf $dmenu_fg_selected

# ~/.xutils/parse_desktopfiles.py | sort -t '	' > ~/.cache/desktopfiles.txt
# NAME=$(sort ~/.cache/desktopfilesuses.txt | join -t "	" --nocheck-order -a 1 ~/.cache/desktopfiles.txt - | sort -t "	" -k3 -n -r | cut -f1 | dmenu $dmenu_flags -p "Launch:" -fn $dmenu_font -i -nb $dmenu_bg -nf $dmenu_fg -sb $dmenu_bg_selected -sf $dmenu_fg_selected)
# [[ -z $NAME ]] && exit 1
# COMMAND=$(grep "$NAME" ~/.cache/desktopfiles.txt | cut -f2)
# 
# [[ ! -e ~/.cache/desktopfileuses.txt ]] && touch ~/.cache/desktopfilesuses.txt
# 
# MATCH=$(grep "$NAME" ~/.cache/desktopfilesuses.txt)
# if [[ "$MATCH" == "" ]]; then
#   echo "$NAME   1" >> ~/.cache/desktopfilesuses.txt
# else
#   MATCHES=${MATCH//[a-zA-Z]/}
#   MATCHES=$[$MATCHES + 1]
#   sed -i "s/$MATCH/$NAME    $MATCHES/" ~/.cache/desktopfilesuses.txt
# fi
# 
# eval "$COMMAND"
