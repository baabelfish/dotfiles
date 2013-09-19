#!/bin/bash
# This file is for performing first time configuration
######################################################
# Use filelock to detect installation
if [[ -e /home/$USER/.xutils/.has_been_initialized ]]; then
  exit 0
fi

# Create skeleton config file for the scripts
if [[ ! -e ~/.xutils/config.sh ]]; then
  echo "#!/bin/bash
LOG_FILE="/home/$USER/.bblog"

TERMINAL='urxvt'

dmenu_list_size=10
dmenu_bg=\"#101010\"
dmenu_bg_selected=\"#202020\"
dmenu_fg=\"#cccccc\"
dmenu_fg_selected=\"#00B020\"
dmenu_font=\"terminus-8\"
dmenu_flags=\"-b\"
dmenu_info=\"\"
" > ~/.xutils/config.sh
fi

# Make needed directories
mkdir ~/.wallpapers

# Download files
wget 'http://wallpapers.wallbase.cc/rozne/wallpaper-2907932.jpg' -O ~/.wallpapers1366x768.png

touch /home/$USER/.xutils/.has_been_initialized
