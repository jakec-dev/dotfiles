#!/bin/bash

readonly color_ok="#50fa7b"
readonly color_alert="#ff5555"

is_dead=$(systemctl --user status get-the-f-up.timer --no-pager | grep dead)

function toggle_notify() {
    if [[ ! -z $is_dead ]]; then
        systemctl --user start get-the-f-up.timer
    else
        systemctl --user stop get-the-f-up.timer
    fi
}

function poly_output() {
    if [[ ! -z $is_dead ]]; then
        echo "%{F$color_alert}"
    else
        echo "%{F$color_ok}"
    fi
}

case "$1" in
    toggle)
        toggle_notify
        ;;
    show)
        dunstctl history-pop
        ;;
    output)
        poly_output
        ;;
esac
