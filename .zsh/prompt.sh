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
    LC=250
    LBC=234
    IC=070
    NC=076
    WC=160
    AC=118
    MAX=236

    RPROMPT="\
%{$(bC 233)%}%{$(fC $((MAX-2)))%} $SEP_RIGHT\
%{$(bC $((MAX-2)))%}%{$(fC $IC)%} %~\
%{$(bC $((MAX-2)))%}%{$(fC $((MAX-1)))%} $SEP_RIGHT\
%{$(bC $((MAX-1)))%}%{$(fC 082)%} %B$GBRANCH%b\
%{$(bC $((MAX-1)))%}%{$(fC $MAX)%} $SEP_RIGHT\
%{$(bC $MAX)%}%{$(fC 076)%} %T %{$reset_color%}"

    PROMPT="\
%{$(bC $((MAX-1)))%}%{$(fC $IC)%} %m \
%{$(bC $((MAX-2)))%}%{$(fC $((MAX-1)))%}$SEP_LEFT\
%{$(bC $((MAX-2)))%}%{$(fC $IC)%} %B$VENV \
%{$(bC 233)%}%{$(fC $((MAX-2)))%}$SEP_LEFT\
%{$reset_color%}%b "

    if [[ ! -z $ERR ]]; then
        PROMPT="%{$(bC $((MAX)))%}%{$(fC $WC)%} %B$ERR %b\
%{$(bC $((MAX-1)))%}%{$(fC $((MAX)))%}$SEP_LEFT\
$PROMPT"
    fi

    }

fi
