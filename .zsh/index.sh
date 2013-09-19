#!/bin/bash
source ~/.zsh/helpers.sh

# Start X-session when logged in from tty1
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
    logout
fi

SOURCES=(
.zsh/colors.sh
.zsh/zshsettings.sh
.xutils/init.sh
.zsh/alias.sh
.zsh/bookmarks.sh
.zsh/help.sh
.zsh/miscfuncs.sh
.zsh/packages.sh
.zsh/prompt.sh
.zsh/tags.sh
.zsh/vimfuncs.sh
)

for i in ${SOURCES[@]}; do
    [[ -e "/home/$USER/$i" ]] && source "/home/$USER/$i"
done
