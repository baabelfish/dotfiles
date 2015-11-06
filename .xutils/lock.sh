#!/bin/bash
# Props to https://github.com/meskarune/i3lock-fancy
 
if [[ -e /usr/bin/convert && -e /usr/bin/composite ]]; then
  IMAGE=/tmp/lockscreen.png
  LOCK=$HOME/.tmp/lock.png

  mkdir -p $HOME/.tmp
  if [[ ! -e "$LOCK" ]]; then
    wget https://raw.githubusercontent.com/meskarune/i3lock-fancy/master/lock.png -O $LOCK
  fi

  if [[ ! -e "$IMAGE" ]]; then

    convert ~/.wallpaper $IMAGE
    convert $IMAGE -level 0%,100%,0.6 -blur 0x2 -font Liberation-Sans -pointsize 26 -fill white -gravity center -annotate +0+200 'Type password to unlock' - | composite -gravity center $LOCK - $IMAGE
  fi
  i3lock -c 000000 --textcolor=ffffff00 --insidecolor=ffffff1c --ringcolor=ffffff3e --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 --insidevercolor=0000001c --ringwrongcolor=00000055 --insidewrongcolor=0000001c -i $IMAGE
else
  i3lock
fi

