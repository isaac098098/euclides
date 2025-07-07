#!/bin/bash

WALLPAPER_DIR="$HOME/pictures/wallpapers/other/"
CURRENT_WALLPAPER=$(hyprctl hyprpaper listloaded)

WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name $(basename "$CURRENT_WALLPAPER") | shuf -n 1)
echo $WALLPAPER

hyprctl hyprpaper reload ,"$WALLPAPER"
