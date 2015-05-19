#!/bin/sh
SCRIPTS=($(find ~/.xutils/baritems/|sed '1d'))
ITEMS=()
for script in ${SCRIPTS[@]}; do
    ITEMS+=($($script))
done

IFS="\n"

FG='#aaaaaa'
BG='#1a1a1a'
WIDTH=$(xdpyinfo|grep dimensions|awk '{print $2}'|cut -f1 -d'x')
HEIGHT=$(xdpyinfo|grep dimensions|awk '{print $2}'|cut -f2 -d'x')
BARHEIGHT=14
FONT='-*-terminus-*-r-normal-*-12-120-*-*-*-*-iso8859-*'


ITEMSSTR=""
for line in ${ITEMS[@]}; do
    ITEMSSTR="$ITEMSSTR^fg()^bg()$line"
done

IFS=" "
echo -e "$ITEMSSTR" | dzen2 -h $BARHEIGHT -w $WIDTH -ta l -fg $FG -bg $BG -fn $FONT -p 3 -e 'button1=exit:13' &
sleep 0.05
transset-df -n 'dzen title' 0.9
