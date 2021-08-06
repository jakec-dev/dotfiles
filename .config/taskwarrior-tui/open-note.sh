#!/bin/bash

task_uuid="$@"
task_project="$(task _get $task_uuid.project)"

if [[ $task_project ]]; then
    file_name="$(task project:$task_project +project uuids)"
    file_heading="$(echo $task_project | awk -F '.' '{print $NF}')"
    file_template="# $file_heading || project:$project_desc \
        \n\n## Inbox | +inbox \
        \n\n## Next Actions | +next and status:pending \
        \n\n## Waiting | status:waiting \
        \n\n## Future | -VISIBLE  \
        \n\n## Completed | status:completed \
        \n\n## Notes"
else
    file_name=$task_uuid
    file_heading="$(task _get $task_uuid.description)"
    file_template="# $file_heading \
        \n\n## Notes"
fi

project_file="$HOME/Documents/Sync/vimwiki/tasks/$file_name.md"
if [[ ! -f $project_file ]]; then
    echo -e $file_template > $project_file
    task $file_name mod +notes
fi

vim -c "VimwikiIndex" -c "VimwikiGoto tasks/$file_name"
