#!/bin/bash

# Save current Hyprland session (window positions and workspaces)

SESSION_FILE="$HOME/.cache/hypr-session.json"

# Save current window layout
hyprctl clients -j > "$SESSION_FILE"

# Count windows saved
COUNT=$(jq length "$SESSION_FILE" 2>/dev/null || echo "0")

notify-send "Session Saved" "$COUNT windows saved to cache"
