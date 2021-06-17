#!/bin/bash
i3-msg 'workspace "1"; append_layout $XDG_CONFIG_HOME/i3/workspace_1.json; workspace "2"; append_layout $XDG_CONFIG_HOME/i3/workspace_2.json'
($TERMINAL --class scratchpadVimwiki -e vim -c "set nonumber norelativenumber" -c VimwikiIndex &)
($TERMINAL --class scratchpadLf -e $SCRIPTS_HOME/lf/lfrun &)
($TERMINAL --class scratchpadTerm &)
($TERMINAL &)
($TERMINAL &)
(keepassxc &)
(qbittorrent &)
(tutanota-desktop &)
($BROWSER &)
