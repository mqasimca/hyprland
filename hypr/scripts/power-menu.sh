#!/bin/bash

# Power Profile Menu - Switch between power profiles using powerprofilesctl

CURRENT=$(powerprofilesctl get)
HEADER="== Power Profile (current: $CURRENT) =="
SEPARATOR="------------------------------"
OPTIONS="Performance
Balanced
Power Saver"

CHOICE=$(printf "%s\n%s\n%s" "$HEADER" "$SEPARATOR" "$OPTIONS" | hyprlauncher --dmenu)

if [ -z "$CHOICE" ] || [ "$CHOICE" = "$HEADER" ] || [ "$CHOICE" = "$SEPARATOR" ]; then
    exit 0
fi

case "$CHOICE" in
    *"Performance"*)
        powerprofilesctl set performance
        notify-send "Power Profile" "Set to Performance"
        ;;
    *"Balanced"*)
        powerprofilesctl set balanced
        notify-send "Power Profile" "Set to Balanced"
        ;;
    *"Power Saver"*)
        powerprofilesctl set power-saver
        notify-send "Power Profile" "Set to Power Saver"
        ;;
esac
