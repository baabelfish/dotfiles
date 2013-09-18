#!/bin/bash

is_set() {
    [[ $# != 1 ]] && return 0
    if [[ -z "$1" ]]; then
        echo 0
    fi
    echo 1
}

calculate() {
    [[ $# != 1 ]] && return 0
    echo "$1"|bc
}

size() {
    [[ $# != 1 ]] && return 0
    echo ${#1}
}

# 1: The string
# 2: Index
at() {
    [[ $# != 2 ]] && return 0
    echo ${1:$2:1}
}

dec() {
    [[ $# != 1 ]] && return 0
    echo $(($1-1))
}

inc() {
    [[ $# != 1 ]] && return 0
    echo $(($1+1))
}

# Pseudofuzzy match
# 1: Input string
# 2: String to match
pfmatch() {
    HASMATCHED=0
    for (( i = 0; i < $(size $2); i++ )); do
        if [[ $(at $2 $i) == $(at $1 $HASMATCHED) ]]; then
            HASMATCHED=$(inc $HASMATCHED)
        fi
        if [[ $HASMATCHED == $(size $1) ]]; then
            echo 1
            return
        fi
    done
    echo 0
}

clear_rest_of_screen() {
    WIDTH=$(term_width)
    EMPTY=""
    for (( i = 0; i < $WIDTH; i++ )); do
        EMPTY=$EMPTY' '
    done

    ROW=$(cursor_pos_row)
    HEIGHT=$(term_height)
    TOGO=$(($HEIGHT-$ROW))
    for (( i = 1; i < $TOGO; i++ )); do
        echo -e '\033[K'
    done
}

clear_rest_of_line() {
    COL=$(cursor_pos_col)
    SIZE=$(term_width)
    EMPTY=""
    for (( i = $COL; i < $SIZE; i++ )); do
        EMPTY=$EMPTY' '
    done
    echo -n $EMPTY
}

cursor_load() {
    echo -e '\033[u'
}

cursor_save() {
    echo -e '\033[s'
}

clear() {
    echo -e '\033[2J'
}

cursor_move() {
    [[ $# != 2 ]] && return 0
    tput cup $1 $2
}

cursor_hide() {
    echo -e "\033[?25l"
}

cursor_show() {
    echo -e "\033[?25h"
}

cursor_pos() {
    exec < /dev/tty
    oldstty=$(stty -g)
    stty raw -echo min 0
    # on my system, the following line can be replaced by the line below it
    echo -en "\033[6n" > /dev/tty
    # tput u7 > /dev/tty    # when TERM=xterm (and relatives)
    IFS=';' read -r -d R -a pos
    stty $oldstty
    # change from one-based to zero based so they work with: tput cup $row $col
    row=$((${pos[0]:2}))    # strip off the esc-[
    col=$((${pos[1]}))
    # echo "$row $col"
}

cursor_pos_row() {
    exec < /dev/tty
    oldstty=$(stty -g)
    stty raw -echo min 0
    # on my system, the following line can be replaced by the line below it
    echo -en "\033[6n" > /dev/tty
    # tput u7 > /dev/tty    # when TERM=xterm (and relatives)
    IFS=';' read -r -d R -a pos
    stty $oldstty
    # change from one-based to zero based so they work with: tput cup $row $col
    row=$((${pos[0]:2}))    # strip off the esc-[
    col=$((${pos[1]}))
    echo "$row"
}

cursor_pos_col() {
    exec < /dev/tty
    oldstty=$(stty -g)
    stty raw -echo min 0
    # on my system, the following line can be replaced by the line below it
    echo -en "\033[6n" > /dev/tty
    # tput u7 > /dev/tty    # when TERM=xterm (and relatives)
    IFS=';' read -r -d R -a pos
    stty $oldstty
    # change from one-based to zero based so they work with: tput cup $row $col
    row=$((${pos[0]:2}))    # strip off the esc-[
    col=$((${pos[1]}))
    echo "$col"
}

term_height() {
    echo $(tput lines)
}

term_width() {
    echo $(tput cols)
}
