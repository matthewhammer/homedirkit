#!/bin/bash

# Path to the file containing the interval (in minutes)
INTERVAL_FILE="$HOME/LogScreenInterval.txt"

# Path to save the screenshots
BASE_DIR="$HOME/LogScreens"

# Create base directory if it doesn't exist
mkdir -p "$BASE_DIR"

# Function to take a screenshot and save it with a timestamp
take_screenshot() {
    # Create a directory for the current date
    DATE_DIR="$BASE_DIR/$(date +%Y-%m-%d)"
    mkdir -p "$DATE_DIR"

    # Take the screenshot with gnome-screenshot and save with timestamped filename
    TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
    FILENAME="$DATE_DIR/screenshot_$TIMESTAMP.png"

    # Check if the screen is on or off
    SCREEN_STATUS=$(xset q | grep "Monitor is")

    if [[ "$SCREEN_STATUS" == *"Monitor is Off"* ]]; then
        # If the screen is off, don't take a screenshot, instead log the event
        echo "Black screen at $TIMESTAMP" > "$DATE_DIR/screenshot_$TIMESTAMP.txt"
    else
        # If the screen is on, take the screenshot
        gnome-screenshot -f "$FILENAME"
    fi
}

# Read the interval from the file (default to 5 minutes if the file doesn't exist or is empty)
read_interval() {
    if [ -f "$INTERVAL_FILE" ]; then
        INTERVAL=$(cat "$INTERVAL_FILE")
        if ! [[ "$INTERVAL" =~ ^[0-9]+$ ]]; then
            INTERVAL=5 # Default to 5 minutes if the file content is invalid
        fi
    else
        INTERVAL=5 # Default to 5 minutes if the file doesn't exist
    fi
}

# Run the script in an infinite loop
while true; do
    read_interval
    take_screenshot
    sleep "${INTERVAL}m"
done
