#!/bin/bash

color_empty="#50fa7b"
color_not_empty="#ff5555"

function inbox() {
    inbox_count=$(task +inbox status:pending count 2>/dev/null)
    if [[ $inbox_count > 0 ]]; then
        echo "%{F$color_not_empty} $inbox_count"
    else
        echo "%{F$color_empty}"
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
