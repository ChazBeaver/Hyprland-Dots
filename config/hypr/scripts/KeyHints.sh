#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Keyhints. Idea got from Garuda Hyprland

# GDK BACKEND. Change to either wayland or x11 if having issues
BACKEND=wayland

# Detect monitor resolution and scale
x_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
y_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
hypr_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')

# Calculate width and height based on percentages and monitor resolution
width=$((x_mon * hypr_scale / 100))
height=$((y_mon * hypr_scale / 100))

# Set maximum width and height
max_width=1200
max_height=1000

# Set percentage of screen size for dynamic adjustment
percentage_width=70
percentage_height=70

# Calculate dynamic width and height
dynamic_width=$((width * percentage_width / 100))
dynamic_height=$((height * percentage_height / 100))

# Limit width and height to maximum values
dynamic_width=$(($dynamic_width > $max_width ? $max_width : $dynamic_width))
dynamic_height=$(($dynamic_height > $max_height ? $max_height : $dynamic_height))

# Launch yad with calculated width and height
GDK_BACKEND=$BACKEND yad --width=$dynamic_width --height=$dynamic_height \
    --center \
    --title="Keybindings" \
    --no-buttons \
    --list \
    --column=Key: \
    --column=Description: \
    --column=Command: \
    --timeout-indicator=bottom \
"" "" "" \
"***************" "Most Important Keys" "***************" \
"" "" "" \
" H" "Launch this app" "" \
"ESC" "close this app" "" \
"=" "SUPER KEY (Windows Key)" "(SUPER KEY)" \
"" "" "" \
"" "" "" \
"***************" "TERMINAL AND APPLICATIONS" "***************" \
"" "" "" \
" enter" "Terminal" "(kitty)" \
" SHIFT enter" "DropDown Terminal" "(kitty-pyprland)" \
" A" "Desktop Overview and Workspace Manager" "(AGS Overview)" \
" D" "App Launcher" "(rofi-wayland)" \
" T" "Open File Manager" "(Thunar)" \
" G" "Google Search" "(rofi)" \
"" "" "" \
"" "" "" \
"***************" "WINDOW MANAGEMENT" "***************" \
"" "" "" \
" Q" "close active window" "(not kill)" \
" SHIFT Q " "kills an active window" "(kill)" \
" F" "Fullscreen" "Toggles to/from full screen" \
" ALT F" "Toggle float" "single window" \
" SHIFT F" "Toggle all windows to float" "all windows" \
" (LEFT mouse-click)" "move selected window" "active window only" \
" (RIGHT mouse-click)" "resize selected window" "active window only" \
" O" "Toggle Transparency/Opaqueness" "active window only" \
" B" "Toggle Blur" "normal or less blur" \
" Z" "Desktop Zoom" "(pyprland)" \
" U " "View Scratchpad" "" \
" SHIFT U " "Move to Scratchpad" "" \
" ALT {1..10} " "Move active window to workspace {1..10} and follow" "" \
" SHIFT {1..10} " "Move active window to workspace {1..10} " "Move Silently" \
" ALT L" "Toggle Dwindle | Master Layout" "Hyprland Layout" \
" P" "Centered window sizing - selected window" "(Dwindle Mode - Pseudo)" \
"" "" "" \
"" "" "" \
"***************" "WALLPAPER MANAGEMENT" "***************" \
"" "" "" \
" W" "Choose wallpaper" "(Wallpaper Menu)" \
" SHIFT W" "Choose wallpaper effects" "(imagemagick + swww)" \
" ALT W" "Random wallpaper" "(via swww)" \
"" "" "" \
"" "" "" \
"***************" "WAYBAR MANAGEMENT" "***************" \
"" "" "" \
" ALT CTRL B" "Kill Waybar" "waybar" \
" CTRL B" "Choose waybar styles" "(waybar styles)" \
" ALT B" "Choose waybar layout" "(waybar layout)" \
" R" "Reload Waybar swaync Rofi" "CHECK NOTIFICATION FIRST!!!" \
"" "" "" \
"" "" "" \
"***************" "SCREENSHOT SHORTCUTS" "***************" \
"" "" "" \
" S" "screenshot" "(grim)" \
" ALT S" "screenshot region" "(grim + slurp)" \
"ALT S" "screenshot region" "(swappy)" \
" CTRL S" "screenshot active window" "active window only" \
" SHIFT S" "screenshot timer 5 secs " "(grim)" \
" Print" "screenshot timer 10 secs " "(grim)" \
"" "" "" \
"" "" "" \
"***************" "SYSTEM POWER CONTROLS" "***************" \
"" "" "" \
" L" "screen lock" "(hyprlock)" \
" SHIFT CTRL L" "screen lock" "(hyprlock)" \
" SHIFT CTRL H" "Hybernate/Suspend" "(hyprlock)" \
" SHIFT CTRL R" "Reboot" "(hyprlock)" \
" SHIFT CTRL P" "Poweroff" "(hyprlock)" \
"CTRL ALT P" "power-menu" "(wlogout)" \
"CTRL ALT Del" "Hyprland Exit" "(SAVE YOUR WORK!!!)" \
"" "" "" \
"" "" "" \
"***************" "File Edit Shortcuts" "***************" \
"" "" "" \
" E" "View or EDIT Keybinds, Settings, Monitor" "" \
" ALT V" "Clipboard Manager" "cliphist" \
" ALT E" "Rofi Emoticons" "Emoticon" \
"" "" "" \
"" "" "" \
"***************" "MISC SHORTCUTS" "***************" \
"" "" "" \
" M" "Launch Music Menu" "🎧🎶" \
" N" "Launch Notification Panel" "swaync Notification Center" \
" SHIFT G" "Gamemode! All animations OFF or ON" "toggle" \
"" "" "" \
"" "" "" \
"More tips:" "https://github.com/JaKooLit/Hyprland-Dots/wiki" ""\
