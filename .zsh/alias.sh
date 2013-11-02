#!/bin/bash
# Moving around
alias back='cd "$OLDPWD";pwd '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

cl() {
    clear
    for (( i = 0; i < $LINES; i++ )); do
        echo ""
    done
}

# Usual stuff
alias o="/home/$USER/.zsh/open.sh"
alias WC="wicd-curses"
alias r="~/.zsh/filemanager.sh"

# XMMS2
alias xa='xmms2 add'
alias xp='xmms2 prev'
alias xn='xmms2 next'
alias xc='xmms2 clear'
alias xs='xmms2 status'
alias xt='xmms2 toggle'
alias xl='xmms2 list'
alias x='xmms2'

# Misc
alias cal='cal -m -y' # More verbose calendar
alias sshp='killall mplayer; export DISPLAY=:0 && mplayer -fs' # Play video over ssh

# Basic things more verbose
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias rmf='rm -fiv'
alias RM='rm -rf'

# Applications
alias pdfmerge='gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=final.pdf -dBATCH'
alias atop='atop -y -1'
alias scp='scp -r -l 8192'
alias alsi='alsi -u'

# Package management
alias pa='yaourt'
alias pai='yaourt -S --noconfirm'
alias par='sudo yaourt -R'
alias pau='yaourt -Syyu'
alias pac='sudo pacman -Syc'

# Git
alias gitC='git diff --name-only --diff-filter=U'
alias giti='git ls-tree -r --name-only'
alias gita='git add'
alias gitb='git branch'
alias gitm='vim $(git diff --name-only --diff-filter=U)'
alias gitph='git push'
alias gitpl='git pull'
alias gitc='git commit'
alias gitc!='git commit -m'
alias gitca='git commit -a'
alias gitca!='git commit -a -m'
alias äpärä='git'

# Keyboard layout
alias use_dvorak='setxkbmap fi dvorak'
alias use_neo='setxkbmap fi neo'
alias use_qwerty='setxkbmap fi qwerty'

alias move_mouse="export DISPLAY=:0 && xdotool mousemove $((RANDOM%300)) $((RANDOM%300))"

# Dev
alias make='make -j $((`cat /proc/cpuinfo|grep processor|wc -l`*2))' # Compile with more cores

# Different ls combinations with color support
if [ -x /usr/bin/dircolors ]; then
    alias l='ls --group-directories-first -X --color=auto'
    alias ld='ls -d */ -X --color=auto'
    alias lda='ls -a -d */(DN) -X --color=auto'
    alias ldt='ls -d */ -tr -X --color=auto'
    alias ldat='ls -atr -d */(DN) -X --color=auto'
    alias ldta='ls -atr -d */(DN) -X --color=auto'
    alias lt='ls -tr --color=auto'
    alias lta='ls -atr --color=auto'
    alias la='ls -a --group-directories-first -X --color=auto'
    alias L='ls -l --group-directories-first -X --color=auto'
    alias Ld='ls -l -d */ -X --color=auto'
    alias Ldt='ls -ltr -d */ -X --color=auto'
    alias Ldta='ls -ltr -d */(DN) -X --color=auto'
    alias Lt='ls -ltr --color=auto'
    alias La='ls -la --group-directories-first -X --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
