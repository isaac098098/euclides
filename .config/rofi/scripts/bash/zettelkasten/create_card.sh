#!/bin/bash

dir="$HOME/zettelkasten/current"

if [ "$1" ]
then
    if [ "$1" == "New root node" ]
    then
        $HOME/.config/rofi/scripts/c/zettelkasten/create_card "$dir/cards" "$1"
        exit 0
    else
        card=$(echo "$1" | awk '{print $1}')
        $HOME/.config/rofi/scripts/c/zettelkasten/create_card "$dir/cards" "$card"
        exit 0
    fi
fi

$HOME/.config/rofi/scripts/c/zettelkasten/sort_cards "$dir/cards"
echo "New root node"
