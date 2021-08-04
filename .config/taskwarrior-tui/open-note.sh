#!/bin/bash

task_uuid="$@"
project_desc="$(task _get $task_uuid.project)"
project_path="$(echo $project_desc | sed 's/\./\//g')"
project_name="$(echo $project_path | awk -F '.' '{print $NF}')"
project_uuid="$(task project:$task_uuid.project +project uuids)"

project_file="$HOME/Documents/Sync/vimwiki/tasks/$project_uuid.md"
if [[ ! -f $project_file ]]; then
    echo -e "# $project_name || project:$project_desc \
        \n\n## Inbox | +inbox \
        \n\n## Next Actions | +next and status:pending \
        \n\n## Waiting | status:waiting \
        \n\n## Future | -VISIBLE  \
        \n\n## Completed | status:completed \
        \n\n## Notes" > $project_file
    task $project_uuid mod +notes
fi

vim -c "VimwikiIndex" -c "VimwikiGoto tasks/$project_uuid"
