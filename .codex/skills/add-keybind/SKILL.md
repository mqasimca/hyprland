---
name: add-keybind
description: Add a new keyboard shortcut to Hyprland configuration. Use when the user wants to bind a key combination to an action.
---

# Add Keybind Skill

Add keyboard shortcuts to the Hyprland configuration.

## Instructions

1. **Read the current keybinds file**:
   ```bash
   cat hypr/config/keybinds.conf
   ```

2. **Read variables from defaults.conf**:
   ```bash
   cat hypr/config/defaults.conf
   ```
   Use variables like `$mainMod`, `$terminal`, `$browser` instead of hardcoding.

3. **Determine the keybind format**:
   ```
   bind = MODS, KEY, dispatcher, params
   ```

   Common modifiers:
   - `$mainMod` (SUPER key)
   - `SHIFT`
   - `CTRL`
   - `ALT`

   Common dispatchers:
   - `exec` - Run a command
   - `killactive` - Close active window
   - `togglefloating` - Toggle float/tile
   - `workspace` - Switch to workspace
   - `movetoworkspace` - Move window to workspace
   - `movetoworkspacesilent` - Move without following
   - `fullscreen` - Toggle fullscreen (0=full, 1=maximize, 2=fake)
   - `togglesplit` - Toggle split direction
   - `movefocus` - Move focus (l/r/u/d)
   - `movewindow` - Move window (l/r/u/d)
   - `resizeactive` - Resize window
   - `pin` - Pin window to all workspaces

4. **Add the keybind** to the appropriate section in `hypr/config/keybinds.conf`:
   - Application launchers go with other app binds
   - Window management with window binds
   - Workspace binds with workspace section

5. **Validate the configuration**:
   ```bash
   hyprctl configerrors
   ```
   Must return no errors.

6. **Reload to test**:
   ```bash
   hyprctl reload
   ```

## Examples

```bash
# Launch terminal
bind = $mainMod, Return, exec, $terminal

# Close window
bind = $mainMod SHIFT, Q, killactive

# Toggle floating
bind = $mainMod, V, togglefloating

# Move focus
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r

# Workspace switching
bind = $mainMod, 1, workspace, 1

# Move to workspace
bind = $mainMod SHIFT, 1, movetoworkspace, 1

# Run custom script
bind = $mainMod, P, exec, ~/.config/hypr/scripts/power-menu.sh

# Bind with repeat (hold key)
binde = $mainMod CTRL, right, resizeactive, 10 0
```

## Bind Variants

- `bind` - Standard keybind
- `binde` - Repeats when held
- `bindl` - Works even when locked
- `bindm` - Mouse bind
- `bindr` - Release bind
- `bindn` - No consume (passes to window)

## Check for Conflicts

Before adding, search for existing binds using the same key:
```bash
grep -i "KEY_NAME" hypr/config/keybinds.conf
```
