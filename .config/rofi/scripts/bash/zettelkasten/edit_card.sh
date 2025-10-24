#!/bin/bash

dir="$HOME/zettelkasten/current/"

if [ "$1" ]
then
    card=$(echo "$1" | awk '{print $1}')
    killall rofi 2>/dev/null

    if [ -S /tmp/nvimsocket_cards ]
    then
        nvim --server /tmp/nvimsocket_cards --remote-tab "$dir/cards/$card.tex" &
    else
        NVIM_LISTEN_ADDRESS=/tmp/nvimsocket_cards \
        st -e nvim --server /tmp/nvimsocket_cards --remote-tab "$dir/cards/$card.tex" 2>/dev/null &
    fi


    # srv_lst=$(vim --serverlist)
    # if [[ "$srv_lst" =~ "VIMCARDS" ]]
    # then
        # vim --servername VIMCARDS --remote-tab "$dir/cards/$card.tex" &
    # else
        # st -e vim --servername VIMCARDS "$dir/cards/$card.tex" 2>/dev/null &
    # fi

    exit 0
fi

$HOME/.config/rofi/scripts/c/zettelkasten/deprecated/sort_cards "$dir/cards"
