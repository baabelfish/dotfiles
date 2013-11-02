#!/bin/bash
help() {
    if [[ ! -z $1 ]]; then
        alias $1
    else
    echo "General help:

Packages: Pai, Par, Parn, pa, pac, pai, pal, par, parm, pau
Git:      gita, gitc, gitc!, giti, gitm, gitr, gitu
"
    fi
}
