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

RPROMPT="\
%{$(bC 233)%}%{$(fC 234)%} $SEP_RIGHT\
%{$(bC 234)%}%{$(fC $IC)%} %m\
%{$(bC 234)%}%{$(fC 235)%} $SEP_RIGHT\
%{$(bC 235)%}%{$(fC 082)%} %B$GBRANCH%b\
%{$(bC 235)%}%{$(fC 236)%} $SEP_RIGHT\
%{$(bC 236)%}%{$(fC 076)%} %~ %{$reset_color%}"

PROMPT="\
%{$(bC 235)%}%{$(fC $IC)%} %B$VENV \
%{$(bC 233)%}%{$(fC 235)%}$SEP_LEFT\
%{$reset_color%}%b "

if [[ ! -z $ERR ]]; then
    PROMPT="%{$(bC 236)%}%{$(fC $WC)%} %B$ERR %b\
%{$(bC 235)%}%{$(fC 236)%}$SEP_LEFT\
$PROMPT "
fi

    }

    # preexec() {
    #     echo -ne "\033[0m"
    # }
fi
