#!/bin/bash
# You can set bookmarks to folders with this.
# This integrates with ranger if installed.
#
# USAGE:
# source this file in your bashrc/zshrc.
#
# M <identifier>  - Marks $PWD to identifier.
# Mr <identifier> - Remove mark by identifier.
# m <identifier>  - Go to folder marked by identifier.
# ml              - List all marks.

# Bookmark location
local bookmarkfile="/home/baabelfish/.zsh_bookmarks"
if [[ -e /usr/bin/ranger ]]; then
    bookmarkfile="/home/$USER/.config/ranger/bookmarks"
fi

# Add a bookmark
M()
{
    if [[ -z $1 || ${#1} -ne 1 ]]; then
        echo "Set a bookmark"
        echo "Usage: M <identifier>"
        echo "Identifier must be one char!"
        return
    fi

    echo $1:$PWD >> $bookmarkfile
    sort $bookmarkfile -o $bookmarkfile
    echo "Saved bookmark $1 ($PWD)"
}

# List all bookmarks
ml()
{
    touch $bookmarkfile
    clear
    echo -n "$color_GREEN"
    echo "Bookmarks:$color_default"
    cat $bookmarkfile
}

# Remove a bookmark
Mr()
{
    if [[ -z $1 ]]; then
        echo "Remove a bookmark"
        echo "Usage: mr <identifier>"
        return
    fi

    cat $bookmarkfile|grep -v "$1:" > $bookmarkfile".bak"
    cat $bookmarkfile.bak > $bookmarkfile
    rm -f $bookmarkfile".bak" > /dev/null
}

# Go to bookmark
m()
{
    if [[ -z $1 ]]; then
        echo "Go to bookmark"
        echo "Usage: m <identifier>"
        return
    fi

    line=$(cat $bookmarkfile|grep "$1:")

    if [[ -z $line ]]; then
        echo "No such identifier!"
        return
    fi
    
    cd "$(echo $line|cut -f2 -d ':')"
}
