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
[[ -e /usr/bin/unclutter ]] && unclutter -idle 2 -noevents&
[[ -e /usr/bin/udiskie ]] && udiskie&
[[ -e /usr/bin/udiskie ]] && bluedevil-monolithic&
[[ -e /usr/bin/xautolock ]] && xautolock -time 10 -locker "i3lock -c 202020"&
[[ -e /usr/bin/compton ]] && compton&
# [[ -e /usr/bin/clipit ]] && clipit&

xinput set-int-prop "DualPoint Stick" "Device Enabled" 8 1
xinput set-int-prop "AlpsPS/2 ALPS DualPoint TouchPad" "Device Enabled" 8 0

if [[ "$(hostname)" == "edge" ]]; then
    xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1 &
    xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2 &
    xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 8 200 &
    xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 8 6 7 4 5 &
    xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Middle Button Emulation" 8 0 &
    xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Middle Button Timeout" 8 50 &
    xinput set-int-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 8 0 &
fi

eval "sleep 8 && transset-df -n i3bar 0.7"&
[[ -e ~/.local/apps/i3/i3 ]] && exec ~/.local/apps/i3/i3 || exec i3
