#!/bin/bash

win=$(xwininfo -root -tree | grep -E 'org.inkscape.Inkscape' | tail -n 1 | awk '{print $1}')

if [[ -n $win ]]
then
    xdotool windowactivate $win
    sleep 0.5
    xdotool key ctrl+s
    xdotool key ctrl+q
    sleep 0.5
    # i3-msg workspace $(cat $HOME/notes/ws)
    rm $HOME/notes/name
    rm $HOME/notes/ws
else
    echo "No inkscape window found"
fi
