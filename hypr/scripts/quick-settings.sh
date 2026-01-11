#!/bin/bash

# Quick Settings Menu - Toggle various Hyprland settings via hyprlauncher

MODE="${1:-}"

if [ "$MODE" = "--power" ]; then
    HEADER="== Power Menu =="
    SEPARATOR="----------------------"
    OPTIONS="󰐥  Shutdown
󰜉  Reboot
󰒲  Suspend
󰍹  Lock Screen
󰈆  Logout"
else
    HEADER="== Quick Settings =="
    SEPARATOR="----------------------"
    OPTIONS="󰖨  Toggle Blur
󰃟  Toggle Night Light
󱡓  Toggle Animations
󰍹  Toggle Dim Inactive
  Toggle Gaps
󰂠  Do Not Disturb
  Power Profile
󰍹  Lock Screen
󰐥  Power Menu"
fi

CHOICE=$(printf "%s\n%s\n%s" "$HEADER" "$SEPARATOR" "$OPTIONS" | hyprlauncher --dmenu)

if [ -z "$CHOICE" ] || [ "$CHOICE" = "$HEADER" ] || [ "$CHOICE" = "$SEPARATOR" ]; then
    exit 0
fi

case "$CHOICE" in
    *"Shutdown"*)
        systemctl poweroff
        ;;
    *"Reboot"*)
        systemctl reboot
        ;;
    *"Suspend"*)
        systemctl suspend
        ;;
    *"Logout"*)
        hyprctl dispatch exit
        ;;
    *"Toggle Blur"*)
        STATE=$(hyprctl getoption decoration:blur:enabled | grep "int:" | awk '{print $2}')
        if [ "$STATE" = "1" ]; then
            hyprctl keyword decoration:blur:enabled false
            notify-send "Blur" "Disabled"
        else
            hyprctl keyword decoration:blur:enabled true
            notify-send "Blur" "Enabled"
        fi
        ;;
    *"Toggle Night Light"*)
        if pgrep -x hyprsunset > /dev/null; then
            pkill hyprsunset
            notify-send "Night Light" "Disabled"
        else
            hyprsunset -t 4500 &
            notify-send "Night Light" "Enabled (4500K)"
        fi
        ;;
    *"Toggle Animations"*)
        STATE=$(hyprctl getoption animations:enabled | grep "int:" | awk '{print $2}')
        if [ "$STATE" = "1" ]; then
            hyprctl keyword animations:enabled false
            notify-send "Animations" "Disabled"
        else
            hyprctl keyword animations:enabled true
            notify-send "Animations" "Enabled"
        fi
        ;;
    *"Toggle Dim Inactive"*)
        STATE=$(hyprctl getoption decoration:dim_inactive | grep "int:" | awk '{print $2}')
        if [ "$STATE" = "1" ]; then
            hyprctl keyword decoration:dim_inactive false
            notify-send "Dim Inactive" "Disabled"
        else
            hyprctl keyword decoration:dim_inactive true
            notify-send "Dim Inactive" "Enabled"
        fi
        ;;
    *"Toggle Gaps"*)
        GAPS=$(hyprctl getoption general:gaps_out | grep "custom" | awk '{print $2}')
        if [ "$GAPS" = "0" ]; then
            hyprctl keyword general:gaps_out 5
            hyprctl keyword general:gaps_in 3
            notify-send "Gaps" "Enabled"
        else
            hyprctl keyword general:gaps_out 0
            hyprctl keyword general:gaps_in 0
            notify-send "Gaps" "Disabled"
        fi
        ;;
    *"Do Not Disturb"*)
        ~/.config/hypr/scripts/dnd-toggle.sh
        ;;
    *"Power Profile"*)
        ~/.config/hypr/scripts/power-menu.sh
        ;;
    *"Lock Screen"*)
        hyprlock
        ;;
    *"Power Menu"*)
        ~/.config/hypr/scripts/quick-settings.sh --power
        ;;
esac
