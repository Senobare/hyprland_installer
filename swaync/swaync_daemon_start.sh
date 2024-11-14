#!/bin/bash

# Check if swaync is running, and start it if not
pgrep -x "swaync" > /dev/null || swaync &
