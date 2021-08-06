#!/bin/bash

OWD="$(pwd)"
cd ~/Documents/Sync/.reminders

arg_before=
arg_after=
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --after)
            arg_after="$2"
            shift
            shift
            ;;
        *)
            arg_before="$1"
            shift
            ;;
    esac
done
remind $arg_before ./main.rem $arg_after

cd "$OWD"
