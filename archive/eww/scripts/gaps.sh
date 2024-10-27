#!/usr/bin/bash
cp $HOME/.config/i3/gaps $HOME/.config/i3/config
cp $HOME/.config/picom/gaps.conf $HOME/.config/picom/picom.conf
sed -i '1s/no_gaps/gaps/' $HOME/.config/eww/eww.yuck
sed -i '1s/no_gaps/gaps/' $HOME/.config/eww/eww.scss
cp $HOME/.config/dunst/gaps $HOME/.config/dunst/dunstrc
eww reload
i3-msg restart
