#!/bin/bash

export PATH=$PATH:~/.local/bin
apps_folder=$HOME/.local/apps
bin_folder=$HOME/.local/bin

# Common =======================================================================
mkdir -p $apps_folder
mkdir -p $bin_folder

# Nim ==========================================================================
nim_folder=$apps_folder/Nim
if [[ ! -e "$nim_folder" ]]; then
    cd $apps_folder
    git clone git://github.com/nim-lang/Nim.git
    cd Nim
    git clone --depth 1 git://github.com/nim-lang/csources
    cd csources && sh build.sh
    cd ..
    bin/nim c koch
    ./koch boot -d:release
    ln -s $nim_folder/compiler/nim $bin_folder/nim
    ln -s $nim_folder/bin/nimble $bin_folder/nimble
    bin/nim e install_nimble.nims
fi

if [[ ! -e "$HOME/.local/apps/nimsuggest" ]]; then
    nimsuggest_folder=$apps_folder/nimsuggest
    cd $apps_folder
    git clone https://github.com/nim-lang/nimsuggest
    cd nimsuggest
    $bin_folder/nimble build
    ln -s $nimsuggest_folder/nimsuggest $bin_folder/nimsuggest
fi
