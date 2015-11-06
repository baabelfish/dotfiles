#!/bin/bash
LINES=($($*))
TEMPFILE=/tmp/linevaltmp

if [[ ! -z "$LINES" ]]; then
    echo -n "" > $TEMPFILE
    for line in ${LINES[@]}; do
        echo $line >> $TEMPFILE
    done

    FILEMOD=$(stat -c "%Y" $TEMPFILE)
    $EDITOR $TEMPFILE
    FILEMODAFTER=$(stat -c "%Y" $TEMPFILE)

    IFS=$'\n'
    LINES=($(cat $TEMPFILE))

    if [[ "$FILEMOD" != "$FILEMODAFTER" ]]; then
        for line in ${LINES[@]}; do
            eval "$line"
        done
    fi
else
    echo "No lines"
fi
