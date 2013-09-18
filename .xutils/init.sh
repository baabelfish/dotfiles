#!/bin/bash
if [[ ! -e ~/.xutils/config.sh ]]; then
echo "#!/bin/bash
LOG_FILE="/home/$USER/.bblog"

TERMINAL='urxvt'

dmenu_list_size=10
dmenu_bg="#101010"
dmenu_bg_selected="#202020"
dmenu_fg="#cccccc"
dmenu_fg_selected="#00B020"
dmenu_font="terminus-8"
dmenu_flags="-b"
dmenu_info=""
" > ~/.xutils/config.sh
fi
