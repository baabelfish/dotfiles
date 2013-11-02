#!/bin/bash
PROMPT_STYLE="fancy"
[[ "$TERM" == "linux" ]] && PROMPT_STYLE="basic"

PS1=":"

if [[ "$PROMPT_STYLE" == "basic" ]]; then
    promptinit
    prompt walters
fi

bC() {
    echo -ne "$BG[$1]"
}

fC() {
    echo -ne "$FG[$1]"
}

if [[ "$PROMPT_STYLE" == "fancy" ]]; then
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
        if [[ -z "$VENV" ]]; then
            VENV="»"
        fi

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

    SEP_LEFT="▶"
    SEP_RIGHT="◀"

    RPROMPT="\
%{$reset_color%}%{$(fC 237)%} $SEP_RIGHT\
%{$(bC 237)%}%{$(fC 082)%} %~%b\
%{$(bC 237)%}%{$(fC 082)%} $SEP_RIGHT\
%{$(bC 082)%}%{$(fC 232)%} %B$GBRANCH %b\
%{$reset_color%}%{$(fC 082)%}◣ \
%{$reset_color%}%{$(fC 076)%}%B%T%b%{$reset_color%}"

    PROMPT="\
%{$(bC 237)%}%{$(fC 082)%} %B%m %b\
%{$(bC 235)%}%{$(fC 237)%}$SEP_LEFT\
%{$(bC 235)%}%{$(fC 112)%} %B$VENV \
%{$reset_color%}%{$(fC 235)%}$SEP_LEFT\
%{$reset_color%}%b "

    if [[ ! -z $ERR ]]; then
        PROMPT="%{$(bC 234)%}%{$(fC 196)%} %B$ERR %b\
%{$(bC 237)%}%{$(fC 234)%}$SEP_LEFT\
$PROMPT"
    fi

    }

fi
