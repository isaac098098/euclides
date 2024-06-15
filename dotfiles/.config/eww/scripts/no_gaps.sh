#!/usr/bin/bash
cp $HOME/.config/i3/no_gaps $HOME/.config/i3/config
cp $HOME/.config/picom/no_gaps.conf $HOME/.config/picom/picom.conf
eww close cattpuccin_X11
eww open cattpuccin_X11_no_pcm
eww update show_gaps_toggle=false
picom -b --config $HOME/.config/picom/picom.conf
i3-msg restart
