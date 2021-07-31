#!/bin/bash

COLOR_MISSING="ff5555"
ICON_MISSING=""
COLOR_COMPLETE="50fa7b"
ICON_COMPLETE=""

get_total_updates() { 
    if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
        updates_arch=0
    fi

    if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
        updates_aur=0
    fi
 
    updates=$((updates_arch + updates_aur)) 
}

check_updates() {
    while true; do
        get_total_updates
        
        #notify user
        if hash notify-send &>/dev/null; then
            if (( updates > 10 )); then
                notify-send -u critical "UPDATE YOUR PACKAGES!" "$updates packages are ready to be updated"
            elif (( updates > 0 )); then
                notify-send -u normal "Updates available!" "$updates packages are ready to be updated"
            fi
        fi
        
        # check for updates every 10 seconds when update is available
        # ensures that icon is changed within 10 seconds of user updating packages
        while (( updates > 0 )); do
            echo "%{F#$COLOR_MISSING}$ICON_MISSING $updates"    
            sleep 10
            get_total_updates
        done

        # check for updates every 30 mins when no update is available
        while (( updates == 0 )); do
            echo "%{F#$COLOR_COMPLETE}$ICON_COMPLETE"
            sleep 1800
            get_total_updates
        done
    done
}

update_packages() {
    $TERMINAL --class=floatingKitty bash -c "sudo pacman -Syu; yay -Syu"
}

case "$1" in
    update) update_packages ;;
    *) check_updates ;;
esac

