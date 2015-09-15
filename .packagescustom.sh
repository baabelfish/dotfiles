#!/bin/bash
if [[ ! -e "$HOME/.local/apps/Nim" ]]; then
    mkdir -p $HOME/.local/apps
    git clone git://github.com/nim-lang/Nim.git
    cd Nim
    git clone --depth 1 git://github.com/nim-lang/csources
    cd csources && sh build.sh
    cd ..
    bin/nim c koch
    ./koch boot -d:release
fi
