#!/bin/bash

sleep 0.2
hyprctl dispatch exec "[workspace 1 silent] kitty -e tmux"
sleep 0.2
hyprctl dispatch exec "[workspace 2 silent] firefox"
sleep 0.2
hyprctl dispatch exec "[workspace 3 silent] Telegram"
