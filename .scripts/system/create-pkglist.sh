#!/bin/bash

outdir="/home/jake"
backup_dir="/media/storage/backup"
pkglist="$(pacman -Qqen)"
pkglist_aur="$(pacman -Qqem)"

case $1 in
    pac-hook)
        echo "$pkglist" > ${outdir}/pkglist.txt
        echo "$pkglist_aur" > ${outdir}/pkglist-aur.txt
        ;;
    backup)
        echo "$pkglist" > ${backup_dir}/pkglist.txt
        echo "$pkglist_aur" > ${backup_dir}/pkglist-aur.txt
        ;;
    *)
        bold="$(tput bold)"
        reset_font="$(tput sgr0)"
        echo "${bold}Official Arch repo packages${reset_font}"
        echo "****************"
        echo "$pkglist"
        echo
        echo "${bold}AUR packages${reset_font}"
        echo "****************"
        echo "$pkglist_aur"
        ;;
esac

