#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
	exec startx
	# exec Hyprland
fi

export PATH=$PATH:/home/isaac09809/.spicetify
