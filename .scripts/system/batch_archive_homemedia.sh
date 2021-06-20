#!/bin/bash

# Compress and archive home media dir by month
#
# e.g. for dir tree:
#
# - home_media/
#   - 2019/
#     - 2019-01/
#   - 2020/
#     - 2020-01/
#     - 2020-02/
#
# `cd` into home_media dir then running this script will create home_media/2019-01.7z, home_media/2020-01.7z, home_media/2020-02.7z

for d in *; do
    for e in $d/*/; do
        folder_path="${e%?}"
        archive_name="${folder_path: -7}"
        7z a $archive_name $folder_path
    done
done
