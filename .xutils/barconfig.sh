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
INACTIVE="#694999"
SEPARATOR="   "

glyph() {
    printf '%b' "\u${1}"
}

wrap() {
    echo -n "%{B$BACKGROUND}$1%{B-}%{F-}"
}

bar_clock() {
    TIME=$(date "+%H:%M:%S")
    echo -n "%{F#cc44ff}$(glyph "f016")%{F-} $TIME"
}

bar_date() {
    DATE=$(date +"%a %d.%m.%Y")
    echo -n "%{F#cc44ff}$(glyph "f06c")%{F-} $DATE"
}

network() {
    CONNECTION=$(nmcli d|grep connected|awk '{print $4}')
    if [[ "$CONNECTION" != "--" ]] && [[ "$CONNECTION" != "Wired" ]]; then
        echo "$(glyph "f1c1") $CONNECTION"
    fi
}

volume() {
    VOL=$(ponymix get-volume)
    MUTED=$(ponymix|grep '\[Muted\]')

    if [[ ! -z "$MUTED" ]]; then
        echo -n "$(glyph "f023") %{F#ff9444}Muted"
    else
        if [[ "$VOL" -gt 60 ]]; then
            echo -n "$(glyph "f025")"
        else
            echo -n "$(glyph "f024")"
        fi
        echo -n " %{F#55cc55}$VOL"
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
            RESULT="%{F#55dc75}$(glyph "f047")"
        elif [[ $STATUS == "Paused" ]]; then
            RESULT="%{F#444444}$(glyph "f048")"
        fi
        RESULT=" $RESULT%{F-} $STR "
        echo -n $(wrap "$RESULT")
    fi
}

workspace() {
    WORKSPACES=($(wmctrl -d|awk '{print $NF}'|sort))
    ACTIVE=$(wmctrl -d|grep '*'|awk '{print $NF}')
    for i in ${WORKSPACES[@]}; do
        if [[ "$i" == "$ACTIVE" ]]; then
            echo -n "%{B$ACTIVEWORKSPACE}%{F#000000} $i %{B$BACKGROUND}%{F-}"
        else
            echo -n " $i "
        fi
    done
}

battery() {
    COM=$(acpi)
    COM="$(echo $COM | cut -f2- -d':')"
    DIRECTION=$(echo "$COM" | awk '{print $1}')
    PERCENT=$(echo "$COM" | awk '{print $2}' | cut -f1 -d',')
    PERCENTNUMBER=$(echo "$COM" | awk '{print $2}' | cut -f1 -d',' | cut -f1 -d'%')
    TIME=$(echo "$COM" | awk '{print $3}')
    HOURS=$(echo "$TIME" | cut -f1 -d':')
    MINUTES=$(echo "$TIME" | cut -f2 -d':')
    SECONDS=$(echo "$TIME" | cut -f3 -d':')
    ISLOW=0

    if [[ -n "$PERCENT" ]]; then
        R=$(echo "obase=16; $((255-$PERCENTNUMBER*255/100))"|bc)
        G=$(echo "obase=16; $(($PERCENTNUMBER*255/100))"|bc)
        B="00"
        STR="%{F#$R$G$B}■ "
        if [[ -n "${TIME}" ]]; then
            STR+="${PERCENT} %{F$INACTIVE}(%{F-}${TIME}%{F$INACTIVE})%{F-}"
        else
            STR+="${PERCENT} "
        fi

        if [[ $PERCENT -le 8 ]]; then
            echo -n "%{B#fff91111} %{F#000000} BATTERY %{F-} "
        else
            echo -n " $STR "
        fi
    fi
}

windowtitle(){
    TITLE=$(xdotool getactivewindow getwindowname)
    if [[ "$TITLE" != "" && "$TITLE" != "float" && "$TITLE" != "stalonetray" ]]; then
        echo "%{B$BACKGROUND} %{F$SEPARATOR}»%{F$WINDOWTITLE} $(echo "$TITLE" | cut -c 1-80) %{F$SEPARATOR}«%{F-} %{B-}"
    fi
}

echo "\
$(wrap "$(workspace)")$SEPARATOR\
$(wrap " $(volume) ")$SEPARATOR\
$(music)$SEPARATOR\
%{c}\
$(windowtitle)$SEPARATOR\
%{r}\
$(wrap "$(battery)")$SEPARATOR\
$(wrap " $(bar_clock) ")$SEPARATOR\
$(wrap " $(bar_date) ")\
"

# %{r}$(wrap " $(network) ")$SEPARATOR\
