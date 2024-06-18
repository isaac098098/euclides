#!/usr/bin/bash
pcm=$(pgrep picom)
if [[ $pcm ]]; then
	pkill -9 picom
	cp $HOME/.config/eww/catppuccin_no_gaps/* $HOME/.config/eww/
	cp $HOME/.config/i3/no_gaps $HOME/.config/i3/config
	eww reload
	eww update is_pcm_active=0
	i3-msg restart
else
	picom -b --config /home/isaac09809/.config/picom/picom.conf
	cp $HOME/.config/i3/gaps $HOME/.config/i3/config
	cp $HOME/.config/eww/catppuccin_gaps/* $HOME/.config/eww/
	eww reload
	eww update is_pcm_active=1
	i3-msg restart
fi
