#!/bin/bash

# Check for --help
for arg in "$@"; do
    if [ "$arg" == "--help" ]; then
        echo "Usage: ./mygrep.sh [options] search_string file_name"
        echo "Options:"
        echo "  -n   Show line numbers"
        echo "  -v   Invert match"
        exit 0
    fi
done

# Parse options
show_line_numbers=0
invert_match=0
while getopts "nv" opt; do
    case $opt in
        n) show_line_numbers=1 ;;
        v) invert_match=1 ;;
        \?) exit 1 ;;
    esac
done
shift $((OPTIND - 1))

# Check number of arguments
if [ $# -ne 2 ]; then
    echo "Usage: ./mygrep.sh [options] search_string file_name"
    exit 1
fi

search_string=$1
file_name=$2

# Check if file exists
if [ ! -f "$file_name" ]; then
    echo "File not found: $file_name"
    exit 1
fi

# Convert search string to lower case
search_lower=$(echo "$search_string" | tr '[:upper:]' '[:lower:]')

# Read the file
line_num=1
while IFS= read -r line; do
    line_lower=$(echo "$line" | tr '[:upper:]' '[:lower:]')
    if [ $invert_match -eq 0 ]; then
        if [[ $line_lower == *"$search_lower"* ]]; then
            if [ $show_line_numbers -eq 1 ]; then
                echo "$line_num:$line"
            else
                echo "$line"
            fi
        fi
    else
        if [[ $line_lower != *"$search_lower"* ]]; then
            if [ $show_line_numbers -eq 1 ]; then
                echo "$line_num:$line"
            else
                echo "$line"
            fi
        fi
    fi
    ((line_num++))
done < "$file_name"