#/bin/bash
# Simple filemanager for bash
# 
# Run command in a directory and change the first character
# on a line to one of following:
# c - Copy files to existing folders
# C - Copy files and creates new folders if they don't exist
# m - Move files to existing folders
# M - Move files and creates new folders if they don't exist
# d - Remove files (rm -f)
# D - Remove files recursively (rm -rf)
# 
# Example:
# - file1.txt
# - file2.txt
# - file3.txt
# 
# ->
#
# M asd/file1.txt
# - renamed_file2.txt
# d file3.txt

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
        C)  if [[ "$OLDFILE" != "$FILE" ]]; then
                echo -e "${yellow}Copying${default} $OLDFILE to $FILE"
                mkdir -p $(echo $FILE|rev|cut -f2- -d '/'|rev)
                cp -r $OLDFILE $FILE
            fi
            ;;
        c)  if [[ "$OLDFILE" != "$FILE" ]]; then
                echo -e "${yellow}Copying${default} $OLDFILE to $FILE"
                cp $OLDFILE $FILE
            fi
            ;;
        M)  if [[ "$OLDFILE" != "$FILE" ]]; then
                echo -e "${yellow}Moving${default} $OLDFILE to $FILE"
                mkdir -p $(echo $FILE|rev|cut -f2- -d '/'|rev)
                mv $OLDFILE $FILE
            fi
            ;;
        -|m)  if [[ "$OLDFILE" != "$FILE" ]]; then
                echo -e "${yellow}Moving${default} $OLDFILE to $FILE"
                mv $OLDFILE $FILE
            fi
            ;;
        *) echo "Unrecognized type \"$TYPE\", with file \"$FILE\""
            ;;
    esac
done
