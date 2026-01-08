#!/bin/sh

# 1. Assign arguments to variables
WRITEFILE=$1
WRITESTR=$2

# 2. Check if both arguments were specified
if [ -z "$WRITEFILE" ] || [ -z "$WRITESTR" ]; then
    echo "Error: Parameters not specified."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

# 3. Create the directory path if it doesn't exist
# 'dirname' extracts the path without the filename
DIRPATH=$(dirname "$WRITEFILE")

if [ ! -d "$DIRPATH" ]; then
    mkdir -p "$DIRPATH"
    if [ $? -ne 0 ]; then
        echo "Error: Could not create directory path $DIRPATH."
        exit 1
    fi
fi

# 4. Write the string to the file
# This will overwrite any existing file
echo "$WRITESTR" > "$WRITEFILE"

# 5. Verify the file was created successfully
if [ $? -ne 0 ]; then
    echo "Error: File $WRITEFILE could not be created."
    exit 1
fi

exit 0