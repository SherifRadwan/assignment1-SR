#!/bin/bash

# 1. Assign arguments to descriptive variables
FILESDIR=$1
SEARCH_STRING=$2

# 2. Check if both arguments were provided
if [ -z "$FILESDIR" ] || [ -z "$SEARCH_STRING" ]; then
    echo "Error: Missing arguments."
    echo "Usage: $0 <filesdir> <search_string>"
    exit 1
fi

# 3. Check if the provided path is actually a directory
if [ ! -d "$FILESDIR" ]; then
    echo "Error: '$FILESDIR' is not a directory or does not exist."
    exit 1
fi

echo "Searching for '$SEARCH_STRING' in '$FILESDIR'..."
echo "-----------------------------------------------"

# 4. Use 'grep' to perform the search
# -r: recursive search
# -n: show line numbers
# -w: (optional) match whole word; remove this if you want partial matches
# -I: ignore binary files
grep -rnI "$SEARCH_STRING" "$FILESDIR"