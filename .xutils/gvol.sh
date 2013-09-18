IF="Master"         # audio channel: Master|PCM
SECS="1"            # sleep $SECS
BG="#111111"        # background colour of window
FG="#eeeeee"        # foreground colour of text/icon
XPOS="20"          # horizontal positioning
YPOS="20"          # vertical positioning
HEIGHT="30"         # window height
WIDTH="50"         # window width

err() {
  echo "$1"
  exit 1
}

usage() {
  echo "usage: dvol [option] [argument]"
  echo
  echo "Options:"
  echo "     -i, --increase - increase volume by \`argument'"
  echo "     -d, --decrease - decrease volume by \`argument'"
  echo "     -t, --toggle   - toggle mute on and off"
  echo "     -h, --help     - display this"
  exit 
}   
    
#Argument Parsing
case "$1" in 
  '-i'|'--increase')
    [ -z "$2" ] && err "No argument specified for increase."
    [ -n "$(tr -d [0-9] <<<$2)" ] && err "The argument needs to be an integer."
    AMIXARG="${2}%+"
    ;;
  '-d'|'--decrease')
    [ -z "$2" ] && err "No argument specified for decrease."
    [ -n "$(tr -d [0-9] <<<$2)" ] && err "The argument needs to be an integer."
    AMIXARG="${2}%-"
    ;;
  '-t'|'--toggle')
    AMIXARG="toggle"
    ;;
  ''|'-h'|'--help')
    usage
    ;;
  *)
    err "Unrecognized option \`$1', see dvol --help"
    ;;
esac

#Actual volume changing (readability low)
AMIXOUT="$(amixer set "$IF" "$AMIXARG" | tail -n 1)"
MUTE="$(echo $AMIXOUT|grep off)"
VOL="$(cut -d '[' -f 2 <<<"$AMIXOUT" | sed 's/%.*//g')"
if [[ ! -z $MUTE ]]; then
    STRING="^fg(#ff2222)$VOL"
else
    STRING="^fg(#cccccc)$VOL"
fi

STRINGSIZE=${#STRING}

OLD=$(pgrep dzen2)
(echo "$STRING" | dzen2 -fn 'termsyn-10' -tw "$WIDTH" -h "$HEIGHT" -x "$XPOS" -y "$YPOS" -bg "$BG" -fg "$FG" -p $SECS)&
sleep 0.05
[[ ! -z $OLD ]] && kill $OLD
