#!/bin/bash

SP_VIMWIKI_EXISTS=$(i3-msg [class="scratchpadVimwiki"] scratchpad show | grep true)

if ! [ -n "$SP_VIMWIKI_EXISTS" ]; then
    $TERMINAL --class scratchpadVimwiki -e vim -c "set nonumber norelativenumber" -c VimwikiIndex
fi
