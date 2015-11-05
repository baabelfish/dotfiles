#!/bin/bash
#      

if [[ ! -x $HOME/.local/bin/lemonbar ]]; then
    cd /tmp
    git clone https://github.com/krypt-n/bar
    cd bar
    make
    cp lemonbar $HOME/.local/bin
fi

BACKGROUND="#aa000000"
HIGHLIGHT="#ffffff"
SEPARATOR="#559955"
WINDOWTITLE="#9999ff"
ACTIVEWORKSPACE="#45bc45"
SEPARATOR="   "

glyph() {
    printf '%b' "\u${1}"
}

wrap() {
    echo -n "%{B$BACKGROUND}$1%{B-}"
}

bar_clock() {
    TIME=$(date "+%H:%M:%S")
    echo -n "$(glyph "f016") $TIME"
}

bar_date() {
    DATE=$(date +"%a %d.%m.%Y")
    echo -n "$DATE"
}

network() {
    CONNECTION=$(nmcli d|grep connected|awk '{print $4}')
    if [[ "$CONNECTION" != "--" ]] && [[ "$CONNECTION" != "Wired" ]]; then
        echo "$(glyph "f1c1") $CONNECTION"
    fi
}

volume() {
    VOL=$(amixer -c1 get Master | grep "Front Left" | sed -n 2p | cut -d'[' -f 2|cut -d '%' -f 1)
    STATE=$(amixer -c1 get Master | grep "Front Left" | sed -n 2p | cut -d'[' -f 3)

    if [[ "$STATE" == "off]" ]]; then
        echo -n "$(glyph "f023") Muted"
    else
        if [[ "$VOL" -gt 60 ]]; then
            echo -n "$(glyph "f025")"
        else
            echo -n "$(glyph "f024")"
        fi
        echo -n " $VOL"
    fi
}

music() {
    STATUS="$(playerctl status)"

    if [[ $STATUS != "" ]]; then
        ARTIST="$(playerctl metadata artist)"
        ALBUM="$(playerctl metadata album | cut -d'(' -f1)"
        TRACK="$(playerctl metadata title | cut -d'(' -f1)"
        STR="$(echo "$ARTIST - $TRACK" | sed -e 's/^ *//' | sed -e 's/ *$//' | cut -c 1-50)"
        RESULT=""

        if [[ $STATUS == "Playing" ]]; then
            RESULT="$(glyph "f047")"
        elif [[ $STATUS == "Paused" ]]; then
            RESULT="$(glyph "f048")"
        fi
        RESULT=" $RESULT $STR "
        echo -n $(wrap "$RESULT")
    fi
}

workspace() {
    WORKSPACES=($(wmctrl -d|awk '{print $NF}'))
    ACTIVE=$(wmctrl -d|grep '*'|awk '{print $NF}')
    for i in ${WORKSPACES[@]}; do
        if [[ "$i" == "$ACTIVE" ]]; then
            echo -n "%{B$ACTIVEWORKSPACE}%{F#000000} $i %{B$BACKGROUND}%{F-}"
        else
            echo -n " $i "
        fi
    done
}

windowtitle(){
    TITLE=$(xdotool getactivewindow getwindowname)
    if [[ "$TITLE" != "" && "$TITLE" != "float" && "$TITLE" != "stalonetray" ]]; then
        echo "%{B$BACKGROUND} %{F$SEPARATOR}»%{F$WINDOWTITLE} $(echo "$TITLE" | cut -c 1-100) %{F$SEPARATOR}«%{F-} %{B-}"
    fi
}

while true; do
    echo "\
$(wrap "$(workspace)")$SEPARATOR\
$(wrap " $(volume) ")$SEPARATOR\
$(music)$SEPARATOR\
%{c}\
$(windowtitle)$SEPARATOR\
%{r}\
$(wrap " $(bar_clock) ")$SEPARATOR\
$(wrap " $(bar_date) ")\
"
    sleep 1;
done | 
lemonbar -o 1 -p -b -B#00000000 -F#A0A0A0 -f "Literation Mono Powerline PNFT-8"\
 | bash

# %{r}$(wrap " $(network) ")$SEPARATOR\
