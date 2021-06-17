#!/bin/bash

## Open new workspace
CURRENT_WS=$(i3-msg -t get_workspaces | jq length)
NEW_WS=$(($CURRENT_WS+ 1))
i3-msg workspace number $NEW_WS
rofi -modi drun, run -show drun -show-icons -display-drun "Search"
