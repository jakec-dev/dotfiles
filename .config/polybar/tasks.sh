#!/bin/bash

color_ok="#50fa7b"
color_warning="#ffb86c"
color_attention="#ff5555"

function inbox() {
    inbox_count=$(task +inbox status:pending count rc.context:none 2>/dev/null)
    if [ $inbox_count -ge 15 ]; then
        echo "%{F$color_attention} $inbox_count"
    elif [ $inbox_count -gt 5 ]; then
        echo "%{F$color_warning} $inbox_count"
    elif [ $inbox_count -gt 0 ]; then
        echo "%{F$color_ok} $inbox_count"
    else
        echo "%{F$color_ok}"
    fi
}

inbox

function top_task() {
    task_id=$(task next limit:1 2>/dev/null | tail -n +4 | head -n 1 | sed 's/^ //' | cut -d ' ' -f1)
    description=$(task _get $task_id.description)
    urgency=$(task _get $task_id.urgency)
    # change color based on status
    # show timer when started
    # click-left to open task list
    # click-right to start/stop task
    # click-right to go to notes/wiki page for task
}
