#!/bin/bash

outdir="/home/jake"
backup_dir="/media/storage/backup"
timestamp="$(date +"%Y-%m-%d_%H-%M")"
pkglist="$(pacman -Qqen)"
pkglist_aur="$(pacman -Qqem)"

case $1 in
    pac-hook)
        trash-put ${outdir}/pkglist*
        echo "$pkglist" > ${outdir}/pkglist.${timestamp}.txt
        echo "$pkglist_aur" > ${outdir}/pkglist-aur.${timestamp}.txt
        ;;
    backup)
        trash-put ${backup_dir}/pkglist*
        echo "$pkglist" > ${backup_dir}/pkglist.${timestamp}.txt
        echo "$pkglist_aur" > ${backup_dir}/pkglist-aur.${timestamp}.txt
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

