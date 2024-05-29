#!/usr/bin/bash
pcm=$(pgrep picom)
#echo $pcm
if [[ $pcm ]]; then
	pkill -9 picom
    sed -i "248,253d" $HOME/.config/i3/config
    sed -i "245d" $HOME/.config/i3/config
    sed -i "245i default_border pixel 5" $HOME/.config/i3/config
    sed -i "248d" $HOME/.config/i3/config
    sed -i "248i smart_borders on" $HOME/.config/i3/config
	eww close cattpuccin_X11
	eww open cattpuccin_X11_no_pcm
	eww update is_pcm_active=0
	i3-msg restart
else
	picom -b --config /home/isaac09809/.config/picom/picom.conf
    sed -i "248d" $HOME/.config/i3/config
    sed -i "248i #smart_borders on" $HOME/.config/i3/config
    sed -i '247i \\ngaps top -15'\\n'gaps right 10'\\n'gaps bottom 10'\\n'gaps left 10'\\n'gaps inner 15' $HOME/.config/i3/config
    sed -i "245d" $HOME/.config/i3/config
    sed -i "245i default_border pixel 0" $HOME/.config/i3/config
	eww close cattpuccin_X11_no_pcm
	eww open cattpuccin_X11
	eww update is_pcm_active=1
	i3-msg restart
fi
