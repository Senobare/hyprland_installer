#!/bin/bash

# Check if an archive file was passed as an argument
archive="$1"

# Ensure the file exists and is not empty
if [[ -z "$archive" || ! -f "$archive" ]]; then
    echo "Please provide a valid archive file."
    exit 1
fi

# Extract based on file extension
case "$archive" in
    *.zip)
        unzip "$archive" -d "$(dirname "$archive")"  # Extract to the same directory as the archive
        ;;
    *.tar.gz)
        tar -xzf "$archive" -C "$(dirname "$archive")"
        ;;
    *.7z)
        7z x "$archive" -o"$(dirname "$archive")"
        ;;
    *)
        echo "Unsupported archive format."
        exit 1
        ;;
esac

