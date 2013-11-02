#/bin/bash
source "$HOME/.zsh/colorcodes.sh"
BLUE="[38;05;67m"
CYAN='\033[1;36m'
GREEN="[38;05;107m"
ORANGE="[38;05;179m"
PURPLE="[38;05;96m"
RED="[38;05;167m"
YELLOW="[38;05;222m"
blue='\033[0;34m'
cyan='\033[0;36m'
default='\033[0m'
green='\033[0;32m'
purple='\033[0;35m'
red='\033[0;31m'
yellow='\033[0;33m'

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
