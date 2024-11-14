#!/bin/bash

# Check if waybar is running
if pgrep -x "waybar" > /dev/null
then
    # If waybar is running, kill it
    pkill waybar
fi

# Start waybar
sleep 1.0
waybar &

