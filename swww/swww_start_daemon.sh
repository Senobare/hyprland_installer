!/usr/bin/bash

#Check if daemon is running
pgrep -x "swww-daemon" > /dev/null

# Start swww daemon if its not running
if [ $? -ne 0 ]; then
	sleep 0.5
	swww-daemon --format xrgb &
fi
