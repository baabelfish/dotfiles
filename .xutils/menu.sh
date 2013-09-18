#!/bin/bash
source ~/.xutils/config.sh
dmenu_run $dmenu_flags -p "Launch:" -fn $dmenu_font -i -nb $dmenu_bg -nf $dmenu_fg -sb $dmenu_bg_selected -sf $dmenu_fg_selected
