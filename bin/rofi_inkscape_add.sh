#!/bin/bash

dgs=$(ls $HOME/notes/current-notes/diagrams)
i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name' > $HOME/notes/ws

if [ "$#" -ne 0 ]
then
    arg=0
    for i in $dgs
    do
        if [[ "$1.svg" == "$i" ]]
        then
            arg=1
            break
        fi
    done

    if [[ $arg == 1 ]]
    then
        break
    else
        echo $1 > $HOME/notes/name
        killall rofi
        python3 $HOME/repos/inkscape-shortcut-manager/main.py &
        sleep 0.1
        xdotool type "incsvg"
        sleep 0.1
        xdotool type "${1}jk"
        sleep 0.1
        i3-msg workspace 7
        cp $HOME/.config/inkscape/templates/default.svg $HOME/notes/current-notes/diagrams/"$1.svg"
        inkscape $HOME/notes/current-notes/diagrams/"$1.svg"
        xwininfo -root -tree | grep -E 'org.inkscape.Inkscape' | tail -n 1 | awk '{print $1}' | xargs xdotool windowactivate
        # xdotool key 5
        # xdotool key ctrl+4
        exit
    fi
fi
