#!/bin/bash

IS_FLOATING=$(hyprctl activewindow -j | jq -r '.floating')

if [ "$IS_FLOATING" = "true" ]; then
    hyprctl dispatch togglefloating
else
    hyprctl dispatch setfloating
    hyprctl dispatch resizeactive exact 600 800
    hyprctl dispatch centerwindow
    #hyprctl dispatch pin 
fi
