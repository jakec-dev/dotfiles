#!/bin/bash

page_title=$(date +"%A, %d %B %Y")
todays_date=$(date +"%Y-%m-%d")
day_of_week=$(date +"%w")

[[ $day_of_week == 0 ]] && is_eow=true || is_eow=false

echo -e "# $page_title

## Content

- [What's On](#What's On)
    - [Calendar](#Calendar)
    - [Overdue](#Overdue | +OVERDUE)
    - [Due Today](#Due Today | +TODAY -OVERDUE and -sod and -eod)
    - [Routines](#Routines)
        - [Start of Day](#Start of Day | +sod and +TODAY)
        - [End of Day](#End of Day | +eod and +TODAY)$([[ is_eow ]] && echo -e "
        - [End of Week](#End of Week | +eow and +TODAY)")
- [Reference](#Reference)
    - [Active Projects](#Active Projects | +next and status:pending and -sod and -eod and (project.none: or description:PROJ\))
    - [Next Actions](#Next Actions | +next and status:pending and -eod and -sod)
    - [Completed Today](#Completed Today | end:$todays_date and -inbox and status:completed)
- [Notes](#Notes)

## What's On

### Calendar

$($SCRIPTS_HOME/system/reminder.sh)

### Overdue | +OVERDUE

### Due Today | +TODAY -OVERDUE and -sod and -eod and -eow

### Routines

#### Start of Day | +sod and +TODAY

#### End of Day | +eod and +TODAY
$([[ is_eow ]] && echo -e "
#### End of Week | +eow and +TODAY

")

## Reference

### Active Projects | +next and status:pending and -sod and -eod and (project.none: or description:PROJ)

### Next Actions | +next and status:pending and -eod and -sod

### Completed Today | end:$todays_date and -inbox and status:completed

## Notes
"

