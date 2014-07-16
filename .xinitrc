#!/bin/bash
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
feh --bg-center ~/.wallpapers/arch.png

export AWT_TOOLKIT=XToolkit
export VDPAU_NVIDIA_NO_OVERLAY=1
export _JAVA_OPTIONS='-Xmx2048m -Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

xrandr --output LVDS1 --primary
urxvtd -q -f -o&
setxkbmap -layout fi
setxkbmap -option caps:escape
xmodmap ~/.xbqwerty
xset dpms 540 1000 2000&
xset -b&
xsetroot -cursor_name left_ptr&

autocutsel -fork&
autocutsel -selection PRIMARY -fork&
[[ -e /usr/bin/start-pulseaudio-x11 ]] && /usr/bin/start-pulseaudio-x11 &
[[ -e /usr/bin/unclutter ]] && unclutter -idle 3 -noevents&
# [[ -e /usr/bin/clipit ]] && clipit&
[[ -e /usr/bin/udiskie ]] && udiskie&
[[ -e /usr/bin/dunst ]] && dunst&
[[ -e /usr/bin/xautolock ]] && xautolock -time 10 -locker "i3lock -c 202020"&
[[ -e /usr/bin/compton ]] && compton&

xinput set-int-prop 12 "Device Enabled" 8 0

exec i3
