#!/bin/bash

tem=($(ls [templates directory] | grep -v '~'))

if [[ "$1" ]]
then
    krita [templates directory]/"$1" &
    killall rofi
    exit 0
fi

echo ${tem[$RANDOM % ${#tem[@]}]}
exit 0
