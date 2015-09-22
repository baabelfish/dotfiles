#!/bin/sh
FG='#aaaaaa'
BG='#1a1a1a'
WIDTH=$(xdpyinfo|grep dimensions|awk '{print $2}'|cut -f1 -d'x')
HEIGHT=$(xdpyinfo|grep dimensions|awk '{print $2}'|cut -f2 -d'x')
BARHEIGHT=14
FONT='-*-terminus-*-r-normal-*-12-120-*-*-*-*-iso8859-*'

IFS=$'\n'
OLDPID=$(ps aux|grep dzen2|grep -v grep|awk '{print $2}')

SCRIPTS=($(find ~/.xutils/baritems/|sed '1d'|sort))
ITEMS=()
for script in ${SCRIPTS[@]}; do
    ITEMS+=($($script))
done

ITEMSSTR=""
SEPARATOR="^fg(#333)^p(8)|^p(8)"
for line in ${ITEMS[@]}; do
    ITEMSSTR+="$SEPARATOR^fg()^bg()$line"
done
ITEMSSTR+=$SEPARATOR

IFS=" "
echo -e "$ITEMSSTR" | dzen2 -y 9999 -xs 1 -h $BARHEIGHT -w $WIDTH -ta c -fg $FG -bg $BG -fn $FONT -p 3 -e 'button1=exit:13' &
echo -e "$ITEMSSTR" | dzen2 -y 9999 -xs 2 -h $BARHEIGHT -w $WIDTH -ta c -fg $FG -bg $BG -fn $FONT -p 3 -e 'button1=exit:13' &
echo -e "$ITEMSSTR" | dzen2 -y 9999 -xs 3 -h $BARHEIGHT -w $WIDTH -ta c -fg $FG -bg $BG -fn $FONT -p 3 -e 'button1=exit:13' &
sleep 0.05
transset-df -n 'dzen title' 0.9
