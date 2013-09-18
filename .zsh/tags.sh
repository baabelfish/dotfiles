#!/bin/bash
# You can set tags to files.
# This integrates with ranger if installed.
#
# USAGE:
# Source this file in your bashrc/zshrc.
#
# T <identifier> <file>  - Marks $PWD to identifier.
# tr <file>              - Remove tag by file.
# tl [identifier]        - List tags.

# Bookmark location
local tagfile="/home/baabelfish/.zsh_tags"
if [[ -e /usr/bin/ranger ]]; then
    tagfile="/home/$USER/.config/ranger/tagged"
fi

# Add a tag
T()
{
    if [[ ! -z $2 && ${#2} -ne 1 ]]; then
        echo "Tag a file with identifier."
        echo "Usage: T <file> [identifier]"
        echo "Identifier must be one char if there is one!"
        return
    fi

    if [[ ! -z $2 ]]; then
        echo $2:$1 >> $tagfile
    else
        echo $1 >> $tagfile
    fi
    sort $tagfile -o $tagfile
    echo "Saved tag $2 ($1)"
}

# List all tag
tl()
{
    touch $tagfile
    clear
    echo -n "$color_GREEN"

    if [[ -z $1 ]]; then
        echo "Tags:$color_default"
        cat $tagfile
    else
        echo "Tags with identifier $1:$color_default"
        cat $tagfile|grep "$1:"
    fi
}

t()
{
    clear
    if [[ -z $1 ]]; then
        echo "$color_GREEN"Tags:"$color_default"
        mimeopen $(cat $tagfile|cut -f2 -d ':'|slmenu -i -l $(($LINES-2)))
    else
        echo "$color_GREEN"Tags with identifier" $1:$color_default"
        mimeopen $(cat $tagfile|grep "$1:"|cut -f2 -d ':'|slmenu -i -l $(($LINES-2)))
    fi
    clear
}

# Remove tags
Tr()
{
    if [[ -z $1 ]]; then
        echo "Remove a tag"
        echo "Usage: Tr <text>"
        return
    fi

    cat $tagfile|grep -v "$1" > $tagfile".bak"
    cat $tagfile.bak > $tagfile
    rm -f $tagfile".bak" > /dev/null
}
