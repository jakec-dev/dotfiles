#!/bin/bash

trash_count="$(trash-list | wc -l)"
echo "Trash can contents:"
trash-list
echo
read -p "Are you sure you want to empty $trash_count items from the trash can? This is irreversible (y/N) " tem_res
if [[ $tem_res = "y" ]]; then
    trash-empty
    echo "$trash_count items permanently deleted"
fi
