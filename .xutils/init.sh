#!/bin/bash
# This file is for performing first time configuration
######################################################
# Use filelock to detect installation
if [[ -e /home/$USER/.xutils/.has_been_initialized ]]; then
  return
fi

sudo echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

# Install necessary apps
sudo pacman -S wget openssh

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
mkdir ~/.wallpapers ~/repos ~/downloads ~/temp ~/images

wget 'http://wallpapers.wallbase.cc/rozne/wallpaper-1107219.png' -O ~/.wallpapers/arch.png

# Install software
sudo pacman --noconfirm -S acpi clipit chromium dunst dzen2 feh feh gvim rxvt-unicode rxvt-unicode-terminfo the_silver_searcher urxvt-perls udiskie unclutter volumeicon zathura zsh tree
yaourt --noconfirm -S compton dwb-git dmenu-xft termsyn

# Install laptop specific software
ISLAPTOP=$(acpi) 2> /dev/null
if [[ ! -z $ISLAPTOP ]]; then
    sudo pacman --noconfirm -S xautolock
fi


touch /home/$USER/.xutils/.has_been_initialized
