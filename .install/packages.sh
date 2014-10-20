#!/bin/bash

LOCATION=~/.local/apps
PACKAGES=($(cat ./packagelist))
INSTALLED="$(yaourt -Qq)"
INSTALLEDMETA="$(pacman -Qg | awk '{print $1}' | uniq)"
NEWPACKAGES=""

echo -ne "\033[32mAlready installed: \033[0m\n"

for P in ${PACKAGES[@]}; do
    if [[ -n "$(echo $INSTALLED $INSTALLEDMETA | grep $P)" ]]; then
        echo -ne "${P} "
    else
        NEWPACKAGES+="$P "
    fi
done

echo -e "\033[0m"

if [[ "$NEWPACKAGES" == "" ]]; then
    echo -e "\033[33mNothing new to install."
else
    echo ""
    yaourt -S --needed --noconfirm $NEWPACKAGES
fi

echo -ne "\033[0m\n"

cd custom
mkdir -p $LOCATION

COMMANDS=($(find . -executable -type f))
for C in ${COMMANDS[@]}; do
    EXISTS="$($C exists)"
    if [[ $EXISTS == "no" ]]; then
        echo -e "\033[1m\033[30m== \033[32m$C \033[30m==\033[0m"
        $C install
        echo "Done"
    else
        echo -e "\033[1m\033[30m== \033[33m$C \033[30m==\033[0m"
        $C update
        echo "Done"
    fi
    echo -e "\033[0m"
done
