#!/bin/bash

source /home/$USER/.zsh/colors.sh
DELTA=5

set_title() {
    echo -e "\e]2;$a$*$2\a"
}

sde_pidof() {
    xprop|grep _NET_WM_PID|cut -d'=' -f2|tr -d ' '
}

sde_ltrace() {
    nocon=0
    while true
    do
        pidi=$1
        if [[ ! -z $pidi ]]; then
            set_title $TITLE_PREFIX' ltrace '$1' [active]'
            clear
            if [[ -z $2 ]]; then
                ltrace -p "$pidi"
            else 
                ltrace -o $1.ltrace -p "$pidi"
            fi
            nocon=0
        elif [[ $nocon -eq 0 ]]; then
            set_title $TITLE_PREFIX' ltrace '$1' [disconnected]'
            echo 'ltrace '$1' [disconnected]'
            if [[ ! -z $2 ]]; then
                vim $1.ltrace
                rm -f $1.ltrace
            fi
            nocon=1
        fi
        sleep $DELTA
    done
}

sde_strace() {
    nocon=0
    while true
    do
        pidi=$1
        if [[ ! -z $pidi ]]; then
            set_title $TITLE_PREFIX' strace '$1' [active]'
            clear
            strace -p "$pidi"
            nocon=0
        elif [[ $nocon -eq 0 ]]; then
            set_title $TITLE_PREFIX' strace '$1' [disconnected]'
            echo 'strace '$1' [disconnected]'
            nocon=1
        fi
        sleep $DELTA
    done
}

sde_memory() {
    nocon=0
    while true
    do
        pidi=$1
        if [[ -z $pidi ]]; then
            pidi=$(ps aux|grep valgrind|grep a.out|grep -v urxvt|grep -v zsh|awk '{print $2}')
        fi
        if [[ ! -z $pidi ]]; then
            set_title $TITLE_PREFIX' mem '$1' [active]'
            clear
            pmap $pidi
            nocon=0
        elif [[ $nocon -eq 0 ]]; then
            set_title $TITLE_PREFIX' mem '$1' [disconnected]'
            echo 'mem '$1' [disconnected]'
            nocon=1
        fi
        sleep $DELTA
    done
}
