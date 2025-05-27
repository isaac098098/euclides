#!/bin/bash

tem=($(ls /home/isaac09809/documents/comm/practices/templates/ | grep -v '~'))

if [[ "$1" ]]
then
    krita /home/isaac09809/documents/comm/practices/templates/"$1" &
    killall rofi
    exit 0
fi

echo ${tem[$RANDOM % ${#tem[@]}]}
exit 0
