#!/bin/bash

page_title=$(date +"%A, %d %B %Y")

echo -e "# $page_title

## Content

- [What's On](#What's On)
    - [Calendar](#Calendar)
    - [Overdue](#Overdue | +OVERDUE)
    - [Due Today](#Due Today | +TODAY -OVERDUE and -sod and -eod)
    - [Routines](#Routines)
        - [Start of Day](#Start of Day | +sod and +TODAY)
        - [End of Day](#End of Day | +eod and +TODAY)
        - Start of Week/End of Week
        - Start of Month/End of Month
- [Reference](#Reference)
    - [Active Projects](#Active Projects | +next and status:pending and -sod and -eod and (project.none: or description:PROJ\))
    - [Next Actions](#Next Actions | +next and status:pending and -eod and -sod)
- [Notes](#Notes)

## What's On

### Calendar

$($SCRIPTS_HOME/system/reminder.sh)

### Overdue | +OVERDUE

### Due Today | +TODAY -OVERDUE and -sod and -eod

### Routines

#### Start of Day | +sod and +TODAY

#### End of Day | +eod and +TODAY

## Reference

### Active Projects | +next and status:pending and -sod and -eod and (project.none: or description:PROJ)

### Next Actions | +next and status:pending and -eod and -sod

## Notes
"

