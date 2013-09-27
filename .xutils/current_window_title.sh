#!/bin/bash
APP="$(xprop -id $(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2) WM_CLASS | rev | cut -f2 -d'"' | rev)"
INFO="$(xprop -id $(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2) _NET_WM_NAME | cut -f2 -d'=' | tr -d '"' )"

if [[ ! -z $APP ]] && [[ "$APP" != "WM_CLASS" ]]; then
    echo "$APP :$INFO"
fi
