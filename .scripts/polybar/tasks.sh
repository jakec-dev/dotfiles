#!/bin/bash

color_empty="#50fa7b"
color_not_empty="#ff5555"

function inbox() {
    inbox_count=$(task +inbox count 2>/dev/null)
    if [[ $inbox_count > 0 ]]; then
        echo "%{F$color_not_empty} $inbox_count"
    else
        echo "%{F$color_empty}"
    fi
}

inbox
