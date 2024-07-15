#!/bin/bash

# Define the device icon (Nerd Font)

# Get the list of connected devices, suppressing "0 devices found" message
connected_devices=$(kdeconnect-cli -a --name-only 2>/dev/null)

# Check if any devices are connected
if [ -z "$connected_devices" ]; then
    echo "%{F#FF757F}No Device Connected"
else
    echo "%{F#C3E88D} $connected_devices"
fi

