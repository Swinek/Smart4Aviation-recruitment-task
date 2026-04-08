#!/bin/bash
DIR="/opt/logs"

cd $DIR

if [ "$EUID" -ne 0 ]; then
    echo "You need to run the script as a root user to get access to /opt/logs!"
    exit 1
fi

find -type f -name "*.log.*" ! -name "*.gz*"| while read file; do
    date=$(date -r "$file" +"%Y.%m.%d")
    
    curr_dir=$(dirname "$file")
    curr_filename=$(basename "$file")

    name="${curr_filename%.log.*}"
    remaining_part="${curr_filename#*.log.}"
    curr_filename="$name.$date.log.$remaining_part"
    
    mv "$file" "$curr_dir/$curr_filename"    
    
    gzip "$curr_dir/$curr_filename"

done

find $DIR -type f -name "*.log.*" -name "*.gz*" -mmin +1 -delete

