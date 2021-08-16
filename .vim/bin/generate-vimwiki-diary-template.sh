#!/bin/bash

page_title=$(date +"%A, %d %B %Y")
todays_date=$(date +"%Y-%m-%d")

echo -e "# $page_title

## Calendar

$($SCRIPTS_HOME/system/reminder.sh)

## Schedule | (scheduled:today or due:today) and status:pending and -sod and -eod and -eow

## Routines | +TODAY and -OVERDUE and (+sod or +eod or +eow)

## Overdue | +OVERDUE

## Completed Today | end:$todays_date and -inbox and status:completed

## Notes
"

