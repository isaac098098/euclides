#!/usr/bin/bash
cp $HOME/.config/i3/gaps $HOME/.config/i3/config
cp $HOME/.config/picom/gaps.conf $HOME/.config/picom/picom.conf
cp $HOME/.config/eww/catppuccin_gaps/* $HOME/.config/eww/
cp $HOME/.config/dunst/gaps $HOME/.config/dunst/dunstrc
eww reload
i3-msg restart
killall dunst
dunst
