#!/bin/bash
# Moving around
alias back='cd "$OLDPWD";pwd '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# alias vim="~/.local/apps/vim/src/vim"
# alias vim="[[ -e ~/.local/apps/vim/src/vim ]] && ~/.local/apps/vim/src/vim || /usr/bin/vim"
alias vi="[[ -e /usr/bin/nvim ]] && /usr/bin/nvim || /usr/bin/vim"

alias initProject="bash <(curl -skL https://raw.github.com/baabelfish/templates/master/init.sh)"

cl() {
    clear
    for (( i = 0; i < $LINES; i++ )); do
        echo ""
    done
}

# Usual stuff
alias o="/home/$USER/.zsh/open.sh"
alias WC="wicd-curses"
alias r="tpm-filemanager"
alias latex2pdf='latexmk -pdf -pvc'

alias tree="tree -A"

# password management
passu() {
  pass --clip $* && killall gpg-agent
}

passi() {
  pass git pull origin master && pass insert $* && pass git push origin master && killall gpg-agent
}

passr() {
  pass git pull origin master && pass rm $* && pass git push origin master && killall gpg-agent
}

passs() {
  pass git pull --rebase origin master && pass git push origin master
}

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
alias sshmount='sshfs -o reconnect,compression=yes,transform_symlinks,ServerAliveInterval=45,ServerAliveCountMax=2,ssh_command="autossh -M 0"'
alias cal='cal -m -y' # More verbose calendar
alias sshp='killall mplayer; export DISPLAY=:0 && mplayer -fs' # Play video over ssh
alias se='sudoedit'

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
alias par='yaourt -R'
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
alias gut='git'

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

function fuck() {
  killall -9 $1;
  if [[ $? == 0 ]]; then
    echo ""
    echo -n "(╯°□°）╯  "
    if [[ -e /usr/bin/toilet ]]; then
      echo ""
      echo "$1"|/usr/bin/toilet -F rotate -F gay
    else
      echo "$1"|~/.zsh/flip
    fi
    echo ""
  fi
}

# TMUX
bmux() {
  local session=$1
  if [[ -z "$session" ]]; then
      session="bmux"
  fi

  if [[ "$HOST" == "$SERVERI_HOSTNAME" ]]; then
    killall bblock; 
    killall tmx; tmux -u attach -d -t $session; logout
  else
    local app="ssh"
    local params="-t"
    local moshpath=$(which mosh)
    if [[ -e "$moshpath" ]]; then
      app="mosh"
      params=""
    fi
    ssh $SERVERI -t "killall bblock; logout; killall tmx"
    $app $SERVERI $params -- tmux -u attach -d -t $session
  fi
}

bmx() {
  local session=$1
  if [[ -z "$session" ]]; then
      session="bmux"
  fi
    if [[ "$HOST" == "$SERVERI_HOSTNAME" ]]; then
        tmx $session
    else
        local app="ssh -t"
        local moshpath=$(which mosh)
        if [[ -e "$moshpath" ]]; then
          app="mosh"
        fi
        $app $SERVERI -- tmx $session
    fi
}

bmuxd() {
  tmux kill-session -t $1
}

bmuxn() {
  if [[ -z "$1" ]]; then
    echo "Specify the name (e.g. bmuxn asdqwe)"
  fi

  if [[ -z "$(tmux ls|awk '{print $1}'|grep "$1")" ]]; then
    tmux -2 new-session -d -s $1
    return
  fi
}

eti() {
  grep -i -r --line-number $* .
}
