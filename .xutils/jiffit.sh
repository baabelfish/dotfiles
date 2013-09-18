#!/bin/bash
if [[ -z $2 ]]; then
  echo "Usage: jiffit <fps> <file>"
  exit
fi
if [[ ! -e /usr/bin/avconv ]] || [[ ! -e /usr/bin/gifsiclei ]]; then
  echo "You need libav with --enable-x11grab, xdotool, gifsicle"
fi

DELAY=$(bc<<<scale=2\;100/\($1\) | cut -d. -f1)

if [[ ! -z "$4" ]]; then
  X=0
  Y=0
  W=$3
  H=$4
else
  echo "Click window to capture"
  WIN=$(xwininfo | egrep -om 1 '0x[0-9a-z]+')
  GEOMETRY=$(xdotool getwindowgeometry $WIN | egrep -om 5 '[0-9]+'|tr '\n' ' ')
  W=$(cut -d" " -f5 <<< $GEOMETRY)
  H=$(cut -d" " -f6 <<< $GEOMETRY)
  X=$(cut -d" " -f2 <<< $GEOMETRY)
  Y=$(cut -d" " -f3 <<< $GEOMETRY)
fi

echo "avconv -f x11grab -s ${W}x${H} -i :0+$X,$Y -r $1 -pix_fmt rgb24 jiffit_tmp.gif"
avconv -f x11grab -s ${W}x${H} -i :0+$X,$Y -r $1 -pix_fmt rgb24 jiffit_tmp.gif
echo Optimizing GIF...
gifsicle --optimize=03 --delay=$DELAY < jiffit_tmp.gif > $2
rm jiffit_tmp.gif
echo Done!
