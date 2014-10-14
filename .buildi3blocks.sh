#!/bin/bash

mkdir -p ~/.local/apps
rm -rf ~/.local/apps/i3blocks
cd ~/.local/apps
git clone https://github.com/vivien/i3blocks
cd i3blocks
git checkout a1782404c7d933145b048d0d1872ea40d7a293b6
make
