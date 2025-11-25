#!/bin/bash
# Toggle mouse sensitivity between 0.0 (normal) and 0.5 (faster)

current=$(hyprctl getoption input:sensitivity -j | jq -r '.float')

# Check if current is 0.0 (or close to it), switch to 0.5, otherwise switch to 0.0
if (($(echo "$current < 0.25" | bc -l))); then
  hyprctl keyword input:sensitivity 0.5
else
  hyprctl keyword input:sensitivity -0.2
fi
