#!/bin/bash
if [[ -z $1 ]]; then
    exit 1
fi

filename=$1
leave=0
echo $filename

case "$filename" in
    *.mp4|*.mkv|*.avi|*.mpg) exe="vlc" && leave=1 ;;
    *.mp3|*.ogg|*.wav) exe="mplayer" && leave=0 ;;
    *.jpg|*.jpeg|*.png|*.bmp) exe="feh" && leave=1 ;;
    *.gif) exe="dwb" && leave=0 ;;
    *.htm|*.html|*.xhtml) exe="dwb" ;;
    *.pdf|*.djvu) exe="zathura" && leave=1 ;;
    *.cbr|*.cbz) exe="mcomix" && leave=1 ;;
    *.doc|*.odt|*.ods|*.odp|*.odf) exe="libreoffice" && leave=1 ;;
    *) exe="vim" ;;
esac

if [[ $leave -eq 1 && "$exe" != "vim" ]]; then
    echo "disowning"
    nohup $exe "$filename" &> /dev/null &
else
    if [[ ! -z $ZSH_VERSION ]]; then
        $exe $filename
    else
        $exe $filename
    fi
fi
