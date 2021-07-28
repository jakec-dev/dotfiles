#!/bin/bash

task_uuid="$@"
project_path="$(task _get $task_uuid.project | sed 's/\./\//g')"
task_desc="$(task _get $task_uuid.description)"

task_file="$HOME/Documents/Sync/vimwiki/tasks/$project_path/$task_uuid.md"
if [[ ! -f $task_file ]]; then
    mkdir -p $HOME/Documents/Sync/vimwiki/tasks/$project_path
    echo "# $task_desc" > $task_file
    task $task_uuid mod +notes
fi

vim -c "VimwikiIndex" -c "VimwikiGoto tasks/$project_path/$task_uuid"
