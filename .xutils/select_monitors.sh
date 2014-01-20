#!/bin/bash
################################################################################
# Prompts for monitor config and sets it
################################################################################
IFS=$'\n'
DISPLAYS=(`xrandr|grep '\<connected\>'|cut -f1 -d' '`)
RESOLUTIONS=(`xrandr|grep -A 1 '\<connected\>'|grep '^ '|sed 's/^\s*//'|sed 's/\s\+.*$//'`)
DISCONNECTED_DISPLAYS=(`xrandr|grep '\<disconnected\>'|cut -f1 -d' '`)
DISPLAY_PRIMARY=99
DISPLAY_SECONDARY=99
DISPLAY_SECONDARY_POSITION=99
OFFLIST=""


if [[ ${#DISPLAYS[@]} == 1 ]]; then
    echo "Press enter to reset display."
    read
    for i in ${DISCONNECTED_DISPLAYS[@]}; do
        xrandr --output $i --off
    done
    xrandr --output "${DISPLAYS[0]}" --auto
    feh --bg-center ~/.wallpapers/1920x1080.png
    exit 0
fi
[[ ${#DISPLAYS[@]} != ${#RESOLUTIONS[@]} ]] && echo "Something went terribly wrong!" && exit
unset $IFS

# Select primary monitor
echo -e "Select the \033[1mprimary\033[0m display:"
for (( i = 0; i < ${#DISPLAYS[@]}; i++ )); do
    echo "$i: ${DISPLAYS[$i]} (${RESOLUTIONS[$i]})"
done
while [[ $DISPLAY_PRIMARY -ge ${#DISPLAYS[@]} ]]; do
    echo -n "> "
    # read DISPLAY_PRIMARY
    stty raw
    DISPLAY_PRIMARY=$(dd bs=1 count=1 2>/dev/null)
    stty -raw
    echo ""
    [[ $DISPLAY_PRIMARY -ge ${#DISPLAYS[@]} ]] && echo "You must select a number between 0 and $[${#DISPLAYS[@]}-1]"
done

# Select secondary monitor
echo -e "Select the \033[1msecondary\033[0m display:"
for (( i = 0; i < ${#DISPLAYS[@]}; i++ )); do
    [[ $i != $DISPLAY_PRIMARY ]] && echo "$i: ${DISPLAYS[$i]} (${RESOLUTIONS[$i]})"
    [[ $i != $DISPLAY_PRIMARY ]] && OFFLIST="$OFFLIST --output ${DISPLAYS[$i]} --off"
done
echo "${#DISPLAYS[@]}: None"
while [[ $DISPLAY_SECONDARY -gt ${#DISPLAYS[@]} ]] || [[ $DISPLAY_SECONDARY == $DISPLAY_PRIMARY ]]; do
    echo -n "> "
    # read DISPLAY_SECONDARY
    stty raw
    DISPLAY_SECONDARY=$(dd bs=1 count=1 2>/dev/null)
    stty -raw
    echo ""
    [[ $DISPLAY_PRIMARY -ge ${#DISPLAYS[@]} ]] && echo "You must select a number between 0 and $[${#DISPLAYS[@]}-1]"
    [[ $DISPLAY_SECONDARY -gt ${#DISPLAYS[@]} ]] && echo "You must select a number between 0 and $[${#DISPLAYS[@]}]"
    [[ $DISPLAY_SECONDARY == $DISPLAY_PRIMARY ]] && echo "Secondary monitor can't be the same as primary"
done

# Multiple displays
if [[ $DISPLAY_SECONDARY -lt ${#DISPLAYS[@]} ]]; then
    # Orientation of the second monitor
    echo -e "Select the position of \033[1msecondary\033[0m display:"
    echo "0: Left of primary"
    echo "1: Right of primary"
    while [[ $DISPLAY_SECONDARY_POSITION -ge 2 ]]; do
        echo -n "> "
        # read DISPLAY_SECONDARY_POSITION
        stty raw
        DISPLAY_SECONDARY_POSITION=$(dd bs=1 count=1 2>/dev/null)
        stty -raw
        echo ""
        [[ $DISPLAY_SECONDARY_POSITION -ge 2 ]] && echo "You must select 0 or 1"
    done

    ORIENTATION="--left-of"
    [[ $DISPLAY_SECONDARY_POSITION -eq 1 ]] && ORIENTATION="--right-of"

    eval "xrandr --output ${DISPLAYS[$DISPLAY_PRIMARY]} --auto$OFFLIST"
    sleep 1
    eval "xrandr --output ${DISPLAYS[$DISPLAY_SECONDARY]} --auto $ORIENTATION ${DISPLAYS[$DISPLAY_PRIMARY]}"
    # feh --bg-fill ~/.wallpapers/massive1.png
# Only one display
else
    eval "xrandr --output ${DISPLAYS[$DISPLAY_PRIMARY]} --auto$OFFLIST"
fi
