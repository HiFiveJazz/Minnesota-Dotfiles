#!/bin/bash

# Define colors
primary_color="#7AA2F7"
alert_color="#FF757F"

# Get the names of devices under "Virtual core keyboard"
filtered_list=$(xinput list --name-only | awk '/Virtual core keyboard/{flag=1; next} /Virtual core pointer/{flag=0} flag || /Virtual core keyboard/')

# Get the name of the Wooting keyboard device from the filtered list
keyboard_name=$(echo "$filtered_list" | grep -i "wooting" | head -n 1)

# Check if a keyboard was found and print its name along with alert color if not found
if [ -z "$keyboard_name" ]; then
  echo "%{F$alert_color} No Wooting keyboard found%{F-}"
else
  echo "%{F$primary_color}$keyboard_name%{F-}"
fi

