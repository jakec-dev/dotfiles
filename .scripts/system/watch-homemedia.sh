#!/bin/bash

# when media is added to TARGET dir, rename and move to PROCESSED dir

TARGET=~/home_media/
PROCESSED=/media/storage/home_media/%Y/%Y-%m/%Y-%m-%d-%H%M%%-c.%%e

inotifywait -m -e create -e moved_to --format "%f" $TARGET \
    | while read FILENAME
        do
            echo Detected $FILENAME, sorting
            exiftool -d $PROCESSED "-filename<CreateDate" $TARGET
        done
