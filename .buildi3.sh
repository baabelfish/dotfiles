#!/bin/sh

mkdir -p ~/.local/apps
rm -rf ~/.local/apps/i3
cd ~/.local/apps
git clone --depth=1 https://github.com/o4dev/i3
cd i3
sed '528,550d' src/ipc.c > src/ipc.c.tmp
mv -f src/ipc.c.tmp src/ipc.c 
make
