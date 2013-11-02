#/bin/bash
IFS=$'\n'

FILES=($(find *))
CHANGEFILE=$HOME/.cache/changefile
CHANGEFILEOLD=$HOME/.cache/changefileold

echo -n "" > $CHANGEFILE

for i in ${FILES[@]}; do
    echo "- $i" >> $CHANGEFILE
done

cp $CHANGEFILE $CHANGEFILEOLD
vim $CHANGEFILE

UFILES=($(cat $CHANGEFILE))
OFILES=($(cat $CHANGEFILEOLD))

if [[ "${#UFILES[@]}" != "${#OFILES[@]}" ]]; then
    echo "Don't change the amount of lines in the buffer"
    exit 1
fi

for (( i = 0; i < ${#UFILES[@]}; i++ )); do
    TYPE=$(echo ${UFILES[$i]}|cut -f1 -d ' ')
    FILE=$(echo ${UFILES[$i]}|cut -f2- -d ' ')
    OLDFILE=$(echo ${OFILES[$i]}|cut -f2- -d ' ')
    case $TYPE in
        d) echo "Deleting \"$FILE\""
            rm -f $FILE
            ;;
        -)  if [[ "$OLDFILE" != "$FILE" ]]; then
                echo "Renaming \"$OLDFILE\" to \"$FILE\""
                mv $OLDFILE $FILE
            fi
            ;;
        *) echo "Unrecognized type \"$TYPE\", with file \"$FILE\""
            ;;
    esac
done

rm -f $CHANGEFILE $CHANGEFILEOLD
