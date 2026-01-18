# First argument is a path
SEARCH_DIR=$1

# Second argument is a string to search for
SEARCH_STR=$2

# Exits with return value 1 error and print statement if any of the parameters is missing
if [ -z "$1" ] || [ -z "$2" ];
then
    echo "Error: Missing parameters. Usage: <SEARCH_DIR> <SEARCH_STR>"
    exit 1
else
    echo "Success: Both parameters provided."
fi

# Check if searchdir is present or not
if [ ! -d "$1" ];
then
    echo "Error: Directory $1 does not exist."
    exit 1
else
    echo "Success: Directory $1 is present."
fi

#Print a message "The number of files are X and the number of matching lines are Y".
NUM_FILES=$(find "$1" -type f | wc -l)
NUM_MATCHING_LINES=$(grep -r "$2" "$1" | wc -l)
echo "The number of files are ${NUM_FILES} and the number of matching lines are ${NUM_MATCHING_LINES}"
exit 0