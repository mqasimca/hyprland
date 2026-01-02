#!/bin/bash

# Restore Hyprland session - shows saved session info
# Note: This shows what apps were open; full restore requires app-specific handling

SESSION_FILE="$HOME/.cache/hypr-session.json"

if [ ! -f "$SESSION_FILE" ]; then
    notify-send "Session Restore" "No saved session found"
    exit 1
fi

# Show saved session info
COUNT=$(jq length "$SESSION_FILE" 2>/dev/null || echo "0")
APPS=$(jq -r '.[].class' "$SESSION_FILE" 2>/dev/null | sort -u | tr '\n' ', ' | sed 's/,$//')

notify-send "Saved Session" "$COUNT windows: $APPS"

# Optionally show in terminal for full details
echo "Saved session contains $COUNT windows:"
jq -r '.[] | "  - \(.class) on workspace \(.workspace.name // .workspace.id)"' "$SESSION_FILE" 2>/dev/null
