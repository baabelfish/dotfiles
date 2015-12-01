#!/bin/bash

BACKGROUND="#aa000000"
HIGHLIGHT="#ffffff"
SEPARATOR="#559955"
WINDOWTITLE="#9999ff"
ACTIVEWORKSPACE="#45bc45"
INACTIVE="#694999"
SEPARATOR="   "

declare -A Elements

wrap() {
    echo -n 
}

doOutput() {
NOUTPUT="\
%{l}\
${Elements["WORKSPACE"]}$SEPARATOR\
${Elements["VOLUME"]}$SEPARATOR\
${Elements["MUSIC"]}$SEPARATOR\
%{c}\
${Elements["WINDOWTITLE"]}$SEPARATOR\
%{r}\
${Elements["BATTERY"]}$SEPARATOR\
${Elements["TIME"]}$SEPARATOR\
${Elements["DATE"]}\
"
if [[ "$NOUTPUT" != "$OUTPUT" ]]; then
    echo -n %{S0}$NOUTPUT
    echo -n %{S1}$NOUTPUT
    echo -n %{S2}$NOUTPUT
    echo ""
    OUTPUT=$NOUTPUT
fi
}

glyph() {
    printf '%b' "\u${1}"
}

FIFO=/tmp/barfifo
if [[ ! -e $FIFO ]]; then
    mkfifo $FIFO
fi

while [[ 1 ]]; do
    echo -e "TIME %{F#cc44ff}$(glyph "f016")%{F-} $(date "+%H:%M:%S")" > $FIFO
    sleep 1
done&

while [[ 1 ]]; do
    echo -e "DATE %{F#cc44ff}$(glyph "f06c")%{F-} $(date +"%a %d.%m.%Y")" > $FIFO
    sleep 60
done&

while [[ 1 ]]; do
    COM=$(acpi)
    COM="$(echo $COM | cut -f2- -d':')"
    DIRECTION=$(echo "$COM" | awk '{print $1}')
    PERCENT=$(echo "$COM" | awk '{print $2}' | cut -f1 -d'%')
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
            STR+="${PERCENT} %{F$INACTIVE}(%{F-}${HOURS}:${MINUTES}%{F$INACTIVE})%{F-}"
        else
            STR+="${PERCENT} "
        fi

        echo "BATTERY  $STR" > $FIFO
    fi
    sleep 120
done&

## Window name
# FIXME use signals
while [[ 1 ]]; do
    TITLE=$(xdotool getactivewindow getwindowname)
    if [[ "$TITLE" != "" && "$TITLE" != "float" && "$TITLE" != "stalonetray" ]]; then
        # echo "WINDOWTITLE %{B$BACKGROUND} %{F$SEPARATOR}»%{F$WINDOWTITLE} $(echo "$TITLE" | cut -c 1-80) %{F$SEPARATOR}«%{F-} %{B-}" > $FIFO
        echo "WINDOWTITLE » $(echo "$TITLE" | cut -c 1-80) «" > $FIFO
    else
        echo "WINDOWTITLE  " > $FIFO
    fi
    sleep 1
done&

# Workspaces
while [[ 1 ]]; do
    RESULT=""
    WORKSPACES=($(wmctrl -d|awk '{print $NF}'|sort))
    ACTIVE=$(wmctrl -d|grep '*'|awk '{print $NF}')
    for i in ${WORKSPACES[@]}; do
        if [[ "$i" == "$ACTIVE" ]]; then
            RESULT="$RESULT%{B$ACTIVEWORKSPACE}%{F#000000} $i %{B$BACKGROUND}%{F-}"
        else
            RESULT="$RESULT $i "
        fi
    done
    echo "WORKSPACE $RESULT" > $FIFO
    sleep 1
done&

# Volume
bar_volume() {
    VOL=$(ponymix get-volume)
    MUTED=$(ponymix|grep '\[Muted\]')
    RESULT=""

    if [[ ! -z "$MUTED" ]]; then
        RESULT="$RESULT$(glyph "f023") %{F#ff9444}Muted"
    else
        if [[ "$VOL" -gt 60 ]]; then
            RESULT="$RESULT$(glyph "f025")"
        else
            RESULT="$RESULT$(glyph "f024")"
        fi
        RESULT="$RESULT %{F#55cc55}$VOL"
    fi
    echo "VOLUME $RESULT" > $FIFO
}
while [[ 1 ]]; do
    bar_volume
    sleep 1
done&


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
        echo "MUSIC $RESULT" > $FIFO
    fi
}
while [[ 1 ]]; do
    music
    sleep 4
done&


while [[ 1 ]]; do
    CONNECTION=$(nmcli d|grep connected|awk '{print $4}')
    if [[ "$CONNECTION" != "--" ]] && [[ "$CONNECTION" != "Wired" ]]; then
        echo "CONNECTION $(glyph "f1c1") $CONNECTION" > $FIFO
    fi
    sleep 60
done&

while read line < $FIFO
do
    if [[ ! -z "$line" ]]; then
        Elements[$(echo -ne $line|cut -f1 -d' ')]="%{B$BACKGROUND} $(echo -ne $line|cut -f2- -d' ') %{B-}%{F-}"
        doOutput
    fi
done
