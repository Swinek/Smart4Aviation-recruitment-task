#!/bin/bash

START_DIR="/opt/logs"

if [ "$EUID" -ne 0 ]; then
    echo "You need to run the script as a root user to get access to /opt/logs!"
    exit 1
fi

mkdir -p $START_DIR

cd $START_DIR

for ((i=0; i<$1; i++))
do
    j=$((RANDOM % 10))
    dir_counter=0
    for ((k=0; k<j; k++))
    do 
        if [ -d "dir$dir_counter" ]; then
            cd dir$dir_counter
        else
            mkdir dir$dir_counter
            cd dir$dir_counter
        fi
        
        dir_counter=$((dir_counter + 1))
    done 

    if [ $((RANDOM % 10)) -ge 5 ]; then
        touch plik$i.log.$RANDOM
    else
        touch plik$i.txt    
    fi
    cd $START_DIR

done

