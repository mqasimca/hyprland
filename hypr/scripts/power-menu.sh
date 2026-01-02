#!/bin/bash

# Power Profile Menu - Switch between power profiles using powerprofilesctl

CURRENT=$(powerprofilesctl get)

OPTIONS="  Performance
  Balanced
  Power Saver"

CHOICE=$(echo -e "$OPTIONS" | wofi --dmenu --prompt "Power Profile (current: $CURRENT)" --width 300 --height 200)

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
