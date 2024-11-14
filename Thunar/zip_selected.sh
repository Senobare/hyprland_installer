#!/bin/bash

# Get the target file or folder
target="$1"

# Check if the target exists
if [[ ! -e "$target" ]]; then
    echo "Invalid file or directory: $target"
    exit 1
fi

# Check if the file is already an archive
case "$target" in
    *.zip|*.tar.gz|*.7z)
        echo "Skipping compression: $target is already an archive."
        exit 0
        ;;
    *)
        # Get the directory and filename of the target
        dir="$(dirname "$target")"
        filename="$(basename "$target")"
        ;;
esac

# Create the archive in the same directory as the target
case "$target" in
    *)
        # For directories, create a zip archive
        zip -r "$dir/$filename.zip" "$target"
        ;;
esac

echo "Compression complete: $target"

