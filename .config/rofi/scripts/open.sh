#!/bin/bash

lecs=$(grep 'lec' $HOME/notes/current-notes/main.tex | sed -n 's/.*lec_\([0-9]\{2\}\).tex.*/\1/p')
last=$(echo "$lecs" | sort -nr | head -n1)
new=$(printf '%02d' $((last + 1)))

# open last or create lecture note

case "$1" in 
    "last")
        killall rofi
        kitty nvim $HOME/notes/current-notes/lec_"$last".tex
    ;;
    "new")
        killall rofi
        sed -i "/\input{lec_${last}.tex}/a \\\\\input{lec_${new}.tex}" "$HOME/notes/current-notes/main.tex"
        kitty nvim $HOME/notes/current-notes/lec_${new}.tex
    ;;
esac

# open lecure note tex file by number

for i in $lecs
do
    title=$(sed -n 's/.*lecture{\([^}]*\)}.*/\1/p' $HOME/notes/current-notes/lec_"$i".tex)
    if [ "$1" == "$i. $title" ]
    then
        killall rofi
        kitty nvim $HOME/notes/current-notes/lec_"$i".tex
    fi
done

# rofi menu

echo "last"
echo "new"
for i in $lecs
do
    title=$(sed -n 's/.*lecture{\([^}]*\)}.*/\1/p' $HOME/notes/current-notes/lec_"$i".tex)
    echo "$i. $title"
done
