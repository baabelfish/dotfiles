#!/bin/bash
cd ~/.local
[[ ! -d apps ]] && mkdir apps
cd apps
rm -rf ~/.local/apps/vim
hg clone https://vim.googlecode.com/hg/ vim
cd vim/src
wget "https://groups.google.com/group/vim_dev/attach/89c9d5c83ccf1231/pum-silent.diff?part=2&authuser=0" -O ycmpatch.diff
hg import ycmpatch.diff
[[ -e ./auto/config.cache ]] && rm ./auto/config.cache
./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --with-compiledby='Arch Linux' \
    --enable-gpm \
    --enable-acl \
    --with-x=yes \
    --enable-gui=gtk2 \
    --enable-multibyte \
    --enable-cscope \
    --enable-netbeans \
    --enable-perlinterp \
    --enable-pythoninterp \
    --disable-python3interp \
    --enable-rubyinterp \
    --enable-luainterp
make VIMRUNTIMEDIR=/usr/share/vim/vim74
