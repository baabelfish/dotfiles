#!/bin/bash

    # exec startxfce4

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# OOPS
# export AWT_TOOLKIT=XToolkit
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export AWT_TOOLKIT=MToolkit
export VDPAU_NVIDIA_NO_OVERLAY=1
export _JAVA_OPTIONS='-Xmx2048m -Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# xrandr --output LVDS1 --primary
autocutsel -selection PRIMARY -fork &
setxkbmap -layout fi
setxkbmap -option caps:escape
xmodmap ~/.xbqwerty
xset dpms 5400 10000 20000
xset -b
xsetroot -cursor_name left_ptr
xset -dpms
xset s off

autocutsel -fork&
autocutsel -selection PRIMARY -fork&
[[ -e /usr/bin/start-pulseaudio-x11 ]] && /usr/bin/start-pulseaudio-x11 &
[[ -e /usr/bin/unclutter ]] && unclutter -idle 2 -noevents&
[[ -e /usr/bin/udiskie ]] && udiskie&
[[ -e /usr/bin/udiskie ]] && bluedevil-monolithic&
[[ -e /usr/bin/compton ]] && compton&
[[ -e /usr/bin/nm-applet ]] && nm-applet&
[[ -e /usr/bin/clipit ]] && clipit&
[[ -e /usr/bin/dunst ]] && dunst&
# [[ -x $HOME/.local/bin/lemonbar ]] && $HOME/.xutils/bar.sh&

# xinput set-int-prop "DualPoint Stick" "Device Enabled" 8 1
# xinput set-int-prop "PS/2 ALPS DualPoint TouchPad" "Device Enabled" 8 0

if [[ "$(hostname)" == "edge" ]]; then
    [[ -e /usr/bin/xautolock ]] && xautolock -time 10 -locker "~/.xutils/lock.sh"&
fi

xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1 &
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2 &
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 8 200 &
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 8 6 7 4 5 &
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Middle Button Emulation" 8 0 &
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Middle Button Timeout" 8 50 &
xinput set-int-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 8 0 &
xinput --disable 12

wmname LG3D
# eval "sleep 8 && transset-df -n i3bar 0.85"&
[[ -f "~/.localdf/pxinitrc" ]] && ~/.localdf/pxinitrc
feh --bg-fill ~/.wallpaper
[[ -e ~/.local/apps/i3/i3 ]] && exec ~/.local/apps/i3/i3 || exec i3
