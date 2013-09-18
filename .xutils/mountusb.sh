#!/bin/bash
#if [[ $1 == "mount" ]]; then
#    USBDEVS=(`dmesg|grep -i 'scsi'|grep removable|cut -f3 -d'['|cut -f1 -d ']'|uniq`)
#    for i in $USBDEVS; do
#        sudo mount -t vfat -o rw,users /dev/${i}1 /media/$i
#    done
#fi

if [[ $1 == "mount" ]]; then
    [[ -e /dev/sdb1 ]] && sudo mount /dev/sdb1 /media/sdb
    [[ -e /dev/sdc1 ]] && sudo mount /dev/sdc1 /media/sdc
    [[ -e /dev/sdd1 ]] && sudo mount /dev/sdd1 /media/sdd
fi

if [[ $1 == "unmount" ]]; then
    sudo fusermount -u /media/sdb
    sudo fusermount -u /media/sdc
    sudo fusermount -u /media/sdd
fi
