#!/bin/bash
VERSION="1.3"

if [ "$EUID" -ne 0 ]; then
    echo "You need to run the script as a root user to get access to /opt/logs!"
    exit 1
fi
    
while (( 1 < 2 )); do
    case "$1" in
        --h)
            echo "Usage: ./run_task.sh [OPTION]"
            echo ""
            echo "This script prepares data and runs the task to rename and compress .log. files in /opt/logs. It also removes .log. files older than 10 days."
            echo ""
            echo "It was assigned by Smart4Aviation as a part of recruitment process for IT Administration intern role."
            echo ""
            echo "This script is only and as much as a helping script to create, manage and display the structure of the directory tree."
            echo ""
            echo -e "\e[4mIf your only goal is to test the task without creating test data, run ./task.sh instead.\e[0m"
            echo ""
            echo "Options:"
            echo "      --h        display this help and exit"
            echo "      --v        output version information and exit"
            exit 0
            ;;
        --v)
            echo "Version: $VERSION"
            exit 0
            ;;
        *)
            break
            ;;
    esac
done


cd "$(dirname "$0")"
./prepare_data.sh 10    
tree /opt/logs
./task.sh
tree /opt/logs