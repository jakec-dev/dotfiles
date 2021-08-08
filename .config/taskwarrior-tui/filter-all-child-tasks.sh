#!/bin/bash

report_uuids=()
get_report_uuids() {
    for i in $(echo $1 | sed "s/,/ /g"); do
        report_uuids+="$i "
        sub_uuids=$(task _get $i.depends)
        if [ "$sub_uuids" ]; then
            get_report_uuids "$sub_uuids"
        fi
    done
}

child_uuids=$(task _get $1.depends)
if [[ ! -z $child_uuids ]]; then
    get_report_uuids "$child_uuids"
    task $report_uuids \(status:pending or status:waiting or status:active\) list; $SHELL
fi
