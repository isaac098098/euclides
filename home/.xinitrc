# i3wm

export XDG_CURRENT_DESKTOP=i3
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP
systemctl --user import-environment DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP

xset s off
xset -dpms
setxkbmap -layout us -variant intl
xset r rate 200 40
exec i3
