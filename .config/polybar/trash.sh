#!/bin/bash

color_empty="#50fa7b"
color_not_empty="#ff5555"

################
# Number of items in trash can
################

function count_trash() {
    trash_count=$(trash-list | wc -l)
    if [[ $trash_count > 0 ]]; then
        echo "%{F$color_not_empty} $trash_count"
    else
        echo "%{F$color_empty}"
    fi
}

count_trash
