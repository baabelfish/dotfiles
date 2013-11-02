#/bin/bash

source "$HOME/.zsh/colorcodes.sh"

IFS=$'\n'

FILES=($(find *))
CHANGEFILE=$HOME/.cache/changefile
CHANGEFILEOLD=$HOME/.cache/changefileold

rm -f $CHANGEFILE $CHANGEFILEOLD

for i in ${FILES[@]}; do
    echo "- $i" >> $CHANGEFILEOLD
done

vim -c 0r\ $CHANGEFILEOLD $CHANGEFILE

if [[ ! -e $CHANGEFILE ]]; then
    echo "Aborting"
    exit 1
fi

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
        D) echo -e "${RED}Deleting${default} $FILE"
            rm -rf $FILE
            ;;
        d) echo -e "${RED}Deleting${default} $FILE"
            rm -f $FILE
            ;;
        -)  if [[ "$OLDFILE" != "$FILE" ]]; then
                echo -e "${yellow}Renaming${default} $OLDFILE to $FILE"
                mv $OLDFILE $FILE
            fi
            ;;
        *) echo "Unrecognized type \"$TYPE\", with file \"$FILE\""
            ;;
    esac
done
