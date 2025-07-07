#!/bin/bash

hyprpaper &

sleep 0.5

WALLPAPER_DIR="$HOME/pictures/wallpapers/other/"
MONITOR="eDP-1"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

hyprctl hyprpaper reload ,"$WALLPAPER"
