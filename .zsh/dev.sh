#!/bin/bash

ccpp() {
    clang++ -g -std=c++1y $* -o main && ./main
}

source /home/$USER/.zsh/colors.sh
DELTA=3

lrepl() {
    LEIN_REPL_PORT=8110 lein repl
}

set_title() {
    echo -e "\e]2;$a$*$2\a"
}

grab_name() {
    xprop|grep _NET_WM_NAME|cut -d'=' -f2|tr -d '"'|tr -d ' '
}

grab_pid() {
    xprop|grep _NET_WM_PID|cut -d'=' -f2|tr -d ' '
}

sde_app() {
    NAME=$1
    nocon=0
    while true
    do
        # Select pid
        PID=$(pgrep $NAME)

        if [[ ! -z $PID ]]; then
            set_title $TITLE_PREFIX' '$NAME' '$2' '$PID' [active]'
            clear
            $2 $3 $4 $5 $6 $7 $8 $PID
            nocon=0
        elif [[ $nocon -eq 0 ]]; then
            set_title $TITLE_PREFIX' '$NAME' '$2' '$PID' [disconnected]'
            nocon=1
        fi
        sleep $DELTA
    done
}

sde() {
    [[ -z $2 ]] && echo "Usage: sde <name of application> <command that takes pid as last argument>" && return
    sde_app $1 $2 $3 $4 $5 $6 $7 $8
}
