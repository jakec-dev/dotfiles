#!/bin/bash

TERMINAL_EXISTS=$(i3-msg [class="scratchpadTerm"] scratchpad show | grep true)

if ! [ -n "$TERMINAL_EXISTS" ]; then
    $TERMINAL --class scratchpadTerm
fi
