#!/bin/bash
PROMPT_STYLE="fancy"
[[ "$TERM" == "linux" ]] && PROMPT_STYLE="basic"

PS1=":"

if [[ "$PROMPT_STYLE" == "basic" ]]; then
    promptinit
    prompt walters
fi

aC() {
    echo -ne "$FG[$1]"
}

if [[ "$PROMPT_STYLE" == "fancy" ]]; then
    # Colors
    LC=250
    IC=070
    NC=076
    WC=196
    AC=118

    precmd() {
        # Show return value
        ERR=$?
        if [[ "$ERR" != "0" ]]; then
            ERR="$ERR"
            # ERR="$(aC $WC)$ERR"
        else
            ERR=""
        fi

        # Show virtual environment
        VENV=$(echo $VIRTUAL_ENV|rev|cut -f1 -d'/'|rev)
        [[ ! -z "$VENV" ]] && VENV="$VENV "

        # Show branch name
        d=$(pwd)
        INGIT=false
        while [[ ! -z "$d" ]] && [[ "$d" != "/" ]]; do
            [[ -d "$d"/.git ]] && INGIT=true && break
            d=${d%/*}
        done

        if [[ $INGIT == true ]]; then
            GBRANCH=$(git branch|grep '^*'|cut -f2 -d' ') 2> /dev/null
            if [[ "$GBRANCH" == "master" ]]; then
                GBRANCH="M"
            else
                GBRANCH="$GBRANCH"
            fi
        fi
        if [[ -z $GBRANCH ]]; then
            GBRANCH="-"
        fi

PROMPT="%{$(aC $LC)%}$VENV\
%{$(aC $IC)%}» %{$reset_color%}%b"

RPROMPT="\
%{$(aC $WC)%}%B$ERR\
%{$reset_color%}%{$(aC $IC)%} « \
%{$(aC $LC)%}%m\
%{$reset_color%}%{$(aC $IC)%} « \
%{$(aC $LC)%}$GBRANCH\
%{$reset_color%}%{$(aC $IC)%} « \
%{$(aC $LC)%}%~\
%b%{$reset_color%}"
    }
fi
