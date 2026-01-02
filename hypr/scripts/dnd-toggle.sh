#!/bin/bash

# Toggle Do Not Disturb mode for mako notifications

if makoctl mode | grep -q "dnd"; then
    makoctl mode -r dnd
    notify-send "Do Not Disturb" "Disabled - Notifications are now enabled"
else
    notify-send "Do Not Disturb" "Enabled - Notifications are now muted"
    sleep 1
    makoctl mode -a dnd
fi
