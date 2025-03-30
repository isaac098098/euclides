#!/bin/bash

tem=($(ls [templates directory]))

if [[ "$1" ]]
then
    krita [templates directory]/${tem[$RANDOM % ${#tem[@]}]} &
    killall rofi
    exit 0
fi

echo ${tem[$RANDOM % ${#tem[@]}]}
exit 0
