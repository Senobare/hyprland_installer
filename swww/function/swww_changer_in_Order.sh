#!/bin/bash

# Directory containing wallpapers
wallpaper_dir="$HOME/Pictures/WallDaemon"

# File to store the last used wallpaper index
index_dir="$HOME/.config/swww/function/tempFiles"
index_file="$index_dir/wallpaper_index"

# Create the directory if it doesn't exist
mkdir -p "$index_dir"

# Get a list of wallpapers in alphabetical order
wallpapers=($(find "$wallpaper_dir" -type f | sort))

# Get the total number of wallpapers
total_wallpapers=${#wallpapers[@]}

# Read the last index from the file, or start from 0 if the file doesn't exist
if [[ -f $index_file ]]; then
    last_index=$(<"$index_file")
else
    last_index=0
fi

# Calculate the next index
next_index=$(( (last_index + 1) % total_wallpapers ))

# Get the next wallpaper
next_wallpaper="${wallpapers[$next_index]}"

# Set the wallpaper and effect
swww img "$next_wallpaper" -t "grow" --transition-fps "60"

# Save the current index to the file
echo "$next_index" > "$index_file"
