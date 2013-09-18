#!/bin/bash
set_title() {
  echo -ne "\e]2;$a$*$2\a"
}

alarm() {
  echo /home/$USER/.alarmrc|at $1
}

v() {
  mFILE=`basename "$*"`
  mDIR=`dirname "$*"`
  cd $mDIR
  feh -d -F `ls` -\| $mFILE
}

# Opening stuff
o() {
  /home/$USER/.zsh/open.sh $*
}

# Find directory under current dir
f() {
  if [[ -e /usr/bin/bcmenu ]]; then
    bcmenu_files && /home/$USER/.zsh/open.sh "$(bcmenu_result)"
    return
  fi
  if [[ -z $1 ]]; then
    echo "Need a search pattern you know... :("
    return
  fi

  found=$(find . -iname $1 -type d|head -n 1)
  echo $found
  if [[ ! -z $found ]]; then
    cd $found
  else
    echo "No such directory!"
  fi
}

# Find directory under home
fh() {
  if [[ -z $1 ]]; then
    echo "Need a search pattern you know... :("
    return
  fi
  cd `find $HOME -type d -iname $1|head -n 1`
  ls
}

# cd and ls
c() {
  cd $1
  ls
}

cd() {
  builtin cd $1
  echo "$PWD" > /home/$USER/.cache/curdir
  chmod 700 /home/$USER/.cache/curdir
}

function C() {
builtin cd "$(cat /home/$USER/.cache/curdir)"
}

# Extract packages
e() {
  atool -x $*
}

# Zip
z() {
  if [[ -z $2 ]]; then
    echo "Usage: z example.zip file1.txt file2.txt dir1 file3.txt ..."
    return
  fi
  zip -r $*
}

# Go to previous visited dir
b() {
  popd > /dev/null
}

# Show directory stack
d() {
  clear
  dirs|tr ' ' '\n'|tac
}

# Go through multiple files with editor
medit() {
  for x in "${*[@]}"
  do
    vim $x
  done
}

bi() {
  sudo pacman -S $(pacman -Sl|grep -v '\[installed'|cut -f2 -d' '|sort|./bcmenu)
}

br() {
  sudo pacman -R $(pacman -Sl|grep '\[installed'|cut -f2 -d' '|sort|./bcmenu)
}

# Show arch linux help
archelp() {
  if [ -f /usr/bin/w3m ]; then
    w3m "http://wiki.archlinux.org/index.php/Special:Search?search=${1}"
  else
    pai w3m
    w3m "http://wiki.archlinux.org/index.php/Special:Search?search=${1}"
  fi
}

r() {
  ~/.zsh/rename.sh $*
}
