#!/usr/bin/bash
cp $HOME/.config/i3/gaps $HOME/.config/i3/config
cp $HOME/.config/picom/gaps.conf $HOME/.config/picom/picom.conf
eww close cattpuccin_X11_no_pcm
eww open cattpuccin_X11
eww update show_gaps_toggle=false
killall picom
picom -b --config $HOME/.config/picom/picom.conf
i3-msg restart
