#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for changing blurs on the fly

notif="$HOME/.config/swaync/images/bell.png"

# Get the current state of "decoration:blur:passes"
STATE=$(hyprctl -j getoption decoration:blur:passes | jq ".int")

# Determine the next state in the cycle
NEXT_STATE=$(( (STATE % 3) + 1 ))

# Switch based on the next state
case $NEXT_STATE in
    1)
        hyprctl keyword decoration:blur:size 1
        hyprctl keyword decoration:blur:passes 1
        notify-send -e -u low -i "$notif" "Transparent"
        ;;
    2)
        hyprctl keyword decoration:blur:size 5
        hyprctl keyword decoration:blur:passes 2
        notify-send -e -u low -i "$notif" "Less blur"
        ;;
    3)
        hyprctl keyword decoration:blur:size 15
        hyprctl keyword decoration:blur:passes 3
        notify-send -e -u low -i "$notif" "Maximum blur"
        ;;
esac
