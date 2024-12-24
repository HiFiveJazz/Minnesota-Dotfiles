#!/bin/bash

# Check if connected to a Wi-Fi network
wifi_network=$(nmcli -t -f active,ssid dev wifi | grep '^yes:' | cut -d: -f2)

# Check if connected to an Ethernet network
ethernet_connection=$(nmcli -t -f device,type,state dev status | grep 'ethernet:connected' | cut -d: -f1)

if [ -n "$wifi_network" ]; then
    # Connected to a Wi-Fi network
    echo -n " "
    echo "%{F#C3E88D}$wifi_network%{F-}"
elif [ -n "$ethernet_connection" ]; then
    # Connected to an Ethernet network
    echo -n " "
    echo "%{F#C3E88D}Ethernet%{F-}"
else
    # Not connected to any network
    echo -n " "
    echo "%{F#FF757F}Disconnected%{F-}"
fi

