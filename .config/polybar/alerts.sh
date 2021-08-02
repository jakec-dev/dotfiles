#!/bin/bash

readonly color_ok="#50fa7b"
readonly color_alert="#ff5555"

function poly_output() {
    is_paused=$(dunstctl is-paused)
    if [[ $is_paused == true ]]; then
        echo "%{F$color_alert}"
    else
        echo "%{F$color_ok}"
    fi
}

case "$1" in
    toggle)
        dunstctl set-paused toggle
        ;;
    show)
        dunstctl history-pop
        ;;
    output)
        poly_output
        ;;
esac
