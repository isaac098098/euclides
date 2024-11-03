#!/bin/bash

cs=$(ls $HOME/notes)

# select current working notes

for i in $cs
do
    if [ "$i" == "$1" ]
    then
        if [ -d "$HOME/notes/current-notes" ]
        then
            rm $HOME/notes/current-notes
        fi
        ln -sf $HOME/notes/"$1" $HOME/notes/current-notes
        exit 0
    fi
done

# rofi menu

for i in $cs
do
    if [ "$i" != "current-notes" ] && [ "$i" != "pream.tex" ] && [ "$i" != "eof.tex" ]
    then
        echo "$i"
    fi
done
