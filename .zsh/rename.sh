#!/bin/sh
# emv - editor mv
#
# Description:
# Rename files with your favourite text editor.
# or: Edit file names using the "document metaphor" ;-) 
#
# This script is intended to be Posix-compliant.
# Tested with coreutils 5.2.1, dash 0.5.2, bash 3.0 and sed 4.1.4.
#
# It was initiated during another nice LUG Sinsheim meeting
# by Torsten Scheck, Uwe Menges, Volker Weiss.
# Special thanks to Marc Lehmann for many valuable hints
# which made emv actually usable.
#
# v1.95 2006-02-17 torsten.scheck@gmx.de
# Latest Version: http://www.i0i0.de/toolchest/emv
#
# Knows issues:
# * Names must not contain new line characters (0x0a)
# * A directory and its entries can't be renamed in the same 
#   emv session.
# * before bash 3.1 the builtin read removes 0x7f, so file names 
#   containing that character can't be renamed.
# * dash 0.5.2 removes 0x81 and 0x88 from variables, so 
#   file names containing those characters won't be listed.
# * dash 0.5.2's builtin read combines '\\' to '\'
#
# This software is provided by the contributors "as is" and any
# express or implied warranties, including, but not limited to, the
# implied warranties of merchantability and fitness for a
# particular purpose are disclaimed. In no event shall the
# contributors be liable for any direct, indirect, incidental,
# special, exemplary, or consequential damages (including, but not
# limited to, procurement of substitute goods or services; loss of
# use, data, or profits; or business interruption) however caused
# and on any theory of liability, whether in contract, strict
# liability, or tort (including negligence or otherwise) arising in
# any way out of the use of this software, even if advised of the
# possibility of such damage.
#
# Copyright is hereby assigned to the Public Domain.

edit=vim
# edit=${VISUAL:-${EDITOR:-vi}}
if [ $# -eq 0 ]; then
    echo "Usage: $0 FILE...
    Rename FILEs with your favourite text editor ($edit), 
    specified by the VISUAL or EDITOR environment variable." 
    exit 0
fi

# create private temp dir and ensure its deletion
umask 077
dir="/var/tmp/emv-$(id -u)-$$"
[ ! -d "$dir" ] && mkdir "$dir"
cleanexit () { rm -rf "$dir"; exit $1; }
trap 'cleanexit 0' 2 15

orgfile="$dir/org-$$"
newfile="$dir/new-$$"
diffile="$dir/dif-$$"
tmpfile="$dir/tmp-$$"
errfile="$dir/err-$$"

# list file names into temp files
# remove trailing '/' of directories passed to allow intermediate renaming step
ls -1d -- "$@" | sed 's/\/$//' | tee "$orgfile" >"$newfile"

# files not found
[ ! -s "$orgfile" ] && cleanexit 1
# detect file names with newlines
if [ $(ls -q -1d -- "$@" | wc -l) -ne $(wc -l <"$orgfile") ]; then
    echo "This script doesn't work for file names containing newline characters. Exiting." >&2
    cleanexit 1
fi

while
    if [ -t 0 ]; then
        "$edit" "$newfile"
    else
        # workaround: for find/xargs: <&1 prevents that editor gets confused by /dev/null being attached 
        # to stdin; not all editors are able to find an appropriate terminal, though.
        "$edit" "$newfile" <&1
    fi
    # remove empty lines
    sed '/^$/ d' "$newfile" > "$tmpfile"
    mv "$tmpfile" "$newfile"
    # detect line count mismatch
    diff=$(( $(wc -l <"$orgfile") - $(wc -l <"$newfile") ))
    [ $diff -ne 0 ]
do
    echo "Line count doesn't match by $diff lines. (press 'Enter' to continue, Ctrl-C to exit)" 
    read enter
done
# quit if file wasn't changed (only if 'cmp' is available)
type cmp >/dev/null 2>&1 && cmp "$orgfile" "$newfile" >/dev/null 2>&1 && cleanexit 0

# remove IFS default value to prevent 'read' from trimming space and tabs
IFS=''
# copy old and new content of changed lines into temp file
exec 3< "$newfile"
while read -r orgline; do 
    read -r newline <&3
    # workaround: dash doesn't like '!' or '('
    if [ "x${orgline}" != "x${newline}" ]; then
        tmpline="$orgline"
        # intermediate renaming step to prevent collision of file names (a->b; b->a) 
        # only if target is not a directory
        if [ ! -d "$newline" ]; then
            tmpline="${orgline}.tmp$$~"
            # -i: safety net, but should have no effect; stdin in is not connected to a terminal
            mv -i -- "$orgline" "$tmpline" 2>>"$errfile" 
            # mark error in intermediate renaming step 
            [ "$?" -ne "0" ] && { newline="err"; orgline="err"; }
        fi
        echo --"$tmpline" >>"$diffile"
        echo --"$newline" >>"$diffile"
        echo --"$orgline" >>"$diffile"
    fi
done <"$orgfile"

# verbosely rename files 
if [ -e "$diffile" ]; then 
    # workaround: echo does not interpret '--' to mean the end of options
    cut -c 3- "$diffile" > "$tmpfile"
    mv "$tmpfile" "$diffile"
    while read -r tmpline && read -r newline && read -r orgline; do 
        # skip errors in intermediate renaming step 
        if [ "x${orgline}" != "x${newline}" ]; then
            # shell doesn't like '<' '=' '>' at this point; workaround?
            if [ -e "$newline" -a ! -d "$newline" ]; then 
                # don't overwrite existing files
                echo "File '$newline' already exists - '$orgline' remains unchanged." >>"$errfile"
                false
            else
                mkdir -v -p $(dirname "$newline") 2>>"$errfile"
                echo " '""$orgline""'" "->" "'""$newline""'"
                mv -i -- "$tmpline" "$newline" 2>>"$errfile" 
            fi
            # if renaming failed, revoke intermediate renaming step
            if [ "$?" -ne "0" -a "x${tmpline}" != "x${orgline}" ]; then 
                mv -i -- "$tmpline" "$orgline" 2>>"$errfile"
            fi
        fi
    done <"$diffile" 
fi

# list errors
[ -e "$diffile" ] && { [ -s "$errfile" ] && cat "$errfile" || echo "All files have been successfully renamed/moved."; }
cleanexit 0
