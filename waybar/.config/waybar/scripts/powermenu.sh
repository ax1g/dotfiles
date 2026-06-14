#!/bin/bash

entries="⏻ Poweroff\n Reboot\n Logout"

selected=$(echo -e "$entries" | rofi -dmenu -p "Power Menu" -width 15 -lines 3 -bw 2 -yoffset -40 -location 3)

case "$selected" in
    "⏻ Poweroff") systemctl poweroff ;;
    " Reboot") systemctl reboot ;;
    " Logout") hyprctl dispatch exit ;;
esac
