#!/bin/bash

SP_LF_EXISTS=$(i3-msg [class="scratchpadLf"] scratchpad show | grep true)

if ! [ -n "$SP_LF_EXISTS" ]; then
    $TERMINAL --class scratchpadLf -e $SCRIPTS_HOME/lf/lfrun 
fi
