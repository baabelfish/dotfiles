#!/bin/bash
# Install packages
Pai() {
    PACKAGES=$(package-query -Slf"%r/%n %v %d"|awk '{ printf "%-30s",$1; printf "%-10s",$2; $1=$2=""; print }'|sort|bcmenu|cut -f2 -d'/'|cut -f1 -d' '|tr '\n' ' ')
    [[ ! -z $PACKAGES ]] && sudo pacman -S $(echo $PACKAGES)
}

# Remove packages
Par() {
    PACKAGES=$(pacman -Sl|grep '\[installed'|cut -f2 -d' '|sort|bcmenu|cut -f2 -d'/'|cut -f1 -d' ')
    [[ ! -z $PACKAGES ]] && yaourt -R $(echo $PACKAGES)
}

# Remove with noconfirm
Parn() {
    PACKAGES=$(pacman -Sl|grep '\[installed'|cut -f2 -d' '|sort|bcmenu|cut -f2 -d'/'|cut -f1 -d' ')
    [[ ! -z $PACKAGES ]] && yaourt -R --noconfirm $(echo $PACKAGES)
}

# List installed packages
pal()
{
    if [[ -n $1 ]]; then
        packages=$(yaourt -Q|grep "$1"|cut -f2 -d'/'|cut -f1 -d' ')

        if [[ -n $packages ]]; then
            echo "\033[1m\033[32mInstalled packages containing \"$1\":\033[0m"
            echo $packages
        fi
    fi    
}

# Remove multiple packages
parm()
{
    if [[ -n $1 ]]; then
        packages=$(yaourt -Q|grep "$1"|cut -f2 -d'/'|cut -f1 -d' ')

        if [[ -n $packages ]]; then
            echo "\033[1m\033[31mQueued for removal:\033[0m"
            echo $packages
            echo ""
            yaourt -R `yaourt -Q|grep "$1"|cut -f2 -d'/'|cut -f1 -d' '|tr '\n' ' '`
        fi
    fi    
}
