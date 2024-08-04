#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 source_path link_name"
    exit 1
fi

SOURCE_PATH=$1
LINK_NAME=$2

# Check if the source path exists
if [ ! -e "$SOURCE_PATH" ]; then
    echo "Error: The source path '$SOURCE_PATH' does not exist."
    exit 1
fi

# Move the file or folder to /opt
if [ -d "$SOURCE_PATH" ]; then
    sudo mv -r "$SOURCE_PATH" /opt
else
    sudo mv "$SOURCE_PATH" /opt
fi

# Get the base name of the moved file or folder
BASE_NAME=$(basename "$SOURCE_PATH")

# Create a symbolic link in /usr/bin
sudo ln -s "/opt/$BASE_NAME" "/usr/bin/$LINK_NAME"
chmod 770 "/usr/bin/$LINK_NAME" 

echo "Moved '$SOURCE_PATH' to /opt and created a symlink in /usr/bin as '$LINK_NAME'."
