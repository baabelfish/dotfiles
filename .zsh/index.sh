#!/bin/bash

export PATH="$HOME/.local/bin:$PATH"

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
$HOME/.zsh/colors.sh
$HOME/.zsh/zshsettings.sh
$HOME/.xutils/init.sh
$HOME/.zsh/alias.sh
$HOME/.zsh/help.sh
$HOME/.zsh/dev.sh
$HOME/.zsh/miscfuncs.sh
$HOME/.zsh/packages.sh
$HOME/.zsh/tags.sh
$HOME/.zsh/vimfuncs.sh
$HOME/.modules/source.sh
/etc/bash_completion.d/password-store
)

for i in ${SOURCES[@]}; do
    [[ -e "$i" ]] && source "$i"
done
