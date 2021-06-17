#!/bin/bash

# Redshift module for polybar 

COLOR_ACTIVE="#50fa7b"
COLOR_INACTIVE="#ff5555"

R_STATUS="$(systemctl --user is-active redshift)"

check_status() {
    if [ "$R_STATUS" == "active" ]; then
        echo "%{F$COLOR_ACTIVE}"
    else
        echo "%{F$COLOR_INACTIVE}"
    fi
}

toggle_redshift() {
    if [ "$R_STATUS" == "active" ]; then
        systemctl --user stop redshift
    else
        systemctl --user start redshift
    fi
}

case "$1" in
    toggle) toggle_redshift ;;
    *) check_status ;;
esac
