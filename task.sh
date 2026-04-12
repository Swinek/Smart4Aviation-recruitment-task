#!/bin/bash
DIR="/opt/logs"
DELETE_CONDITION_REGEX="*.[0-9][0-9][0-9][0-9].[0-9][0-9].[0-9][0-9].log.*.gz" 
DELETE_TIME=+10

if [ "$EUID" -ne 0 ]; then
    echo "You need to run the script as a root user to get access to /opt/logs!"
    exit 1  
fi

find "$DIR" -type f -name "*.log.*" ! -name "*.gz"| while read -r file; do
    date=$(date -r "$file" +"%Y.%m.%d")
    curr_dir=$(dirname "$file")
    curr_filename=$(basename "$file")

    name="${curr_filename%%.log.*}"
    remaining_part="${curr_filename#*.log.}"
    
    new_filename="$name.$date.log.$remaining_part"
    
    mv "$file" "$curr_dir/$new_filename"    
    
    gzip "$curr_dir/$new_filename"

done

find "$DIR" -type f -name "$DELETE_CONDITION_REGEX" -mtime "$DELETE_TIME" -delete
    



