#!/bin/bash
# Start X-session when logged in from tty1
if [[ -z "$DISPLAY" ]] && [[ $(tty) =~ /dev/tty ]]; then
    clear
    [[ -e /bin/alsi ]] && alsi -l
    echo ""
    echo "\033[32m\033[1mChoose the manager:\033[0m
    \033[32m1: \033[0m\
    i3
    \033[32m2: \033[0m\
    None"
    echo -ne "> "
    read choice
    case $choice in
      2)
          clear
          ;;
      *)
          exec startx
          logout
          ;;
    esac
else
    [[ -f ~/.Xresources ]] && [[ -z "$SSH_CLIENT" ]] && xrdb -merge ~/.Xresources
fi

source ~/.zsh/helpers.sh

SOURCES=(
.zsh/colors.sh
.zsh/zshsettings.sh
.xutils/init.sh
.zsh/alias.sh
.zsh/help.sh
.zsh/dev.sh
.zsh/miscfuncs.sh
.zsh/packages.sh
.zsh/tags.sh
.zsh/vimfuncs.sh
.local/tpm/.config
)

for i in ${SOURCES[@]}; do
    [[ -e "$HOME/$i" ]] && source "$HOME/$i"
done
