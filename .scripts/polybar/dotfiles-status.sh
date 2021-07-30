#!/bin/bash

color_ok="#50fa7b"
color_attention="#ff5555"

function count_unstaged() {
    unstaged_count=$(git --git-dir=$HOME/.cfg/ --work-tree=$HOME status -s -uno | wc -l)
    if [ $unstaged_count -gt 0 ]; then
        echo "%{F$color_attention} $unstaged_count"
    else
        echo "%{F$color_ok}"
    fi
}
count_unstaged
