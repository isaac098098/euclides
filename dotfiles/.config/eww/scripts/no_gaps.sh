#!/usr/bin/bash
cp $HOME/.config/i3/no_gaps $HOME/.config/i3/config
cp $HOME/.config/picom/no_gaps.conf $HOME/.config/picom/picom.conf
cp $HOME/.config/eww/catppuccin_no_gaps/* $HOME/.config/eww/
cp $HOME/.config/dunst/no_gaps $HOME/.config/dunst/dunstrc
eww reload
i3-msg restart
killall dunst
dunst
