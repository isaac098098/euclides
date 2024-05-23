#!/usr/bin/bash
pcm=$(pgrep picom)
#echo $pcm
if [[ $pcm ]]; then
	cp /home/isaac09809/.config/i3/config_picom_off /home/isaac09809/.config/i3/config
	i3-msg restart
	eww close cattpuccin_X11
	eww open cattpuccin_X11_no_pcm
	pkill -9 picom
	eww update is_pcm_active=0
else
	cp /home/isaac09809/.config/i3/config_picom_on /home/isaac09809/.config/i3/config
	i3-msg restart
	picom -b --config /home/isaac09809/.config/picom/picom.conf
	eww close cattpuccin_X11_no_pcm
	eww open cattpuccin_X11
	eww update is_pcm_active=1
fi
