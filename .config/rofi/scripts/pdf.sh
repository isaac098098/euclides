#!/bin/bash

lecs=$(grep 'lec' $HOME/notes/current-notes/main.tex | sed -n 's/.*lec_\([0-9]\{2\}\).tex.*/\1/p')
last=$(echo "$lecs" | sort -nr | head -n1)

# open last lecture note pdf

case "$1" in 
    "last")
        killall rofi
        for (( i=1; i<=$last-1; i++ ))
        do
            sed -i "s/^\\\\\input{lec_$(printf '%02d' $i).tex}/% \\\\\input{lec_$(printf '%02d' $i).tex}/g" $HOME/notes/current-notes/main.tex
        done
        sed -i "s/^% \\\\\input{lec_${last}.tex}/\\\\\input{lec_${last}.tex}/g" "$HOME/notes/current-notes/main.tex"
        latexmk -output-directory="$HOME/notes/current-notes/" "$HOME/notes/current-notes/main.tex" > /dev/null
        pdflatex -output-directory="$HOME/notes/current-notes/" "$HOME/notes/current-notes/main.tex" > /dev/null
        zathura $HOME/notes/current-notes/main.pdf
    ;;
    "all")
        killall rofi
        sed -i "s/% //g" $HOME/notes/current-notes/main.tex
        latexmk -output-directory="$HOME/notes/current-notes/" "$HOME/notes/current-notes/main.tex" > /dev/null
        pdflatex -output-directory="$HOME/notes/current-notes/" "$HOME/notes/current-notes/main.tex" > /dev/null
        zathura $HOME/notes/current-notes/main.pdf
    ;;
esac

# open lecture note pdf by number

for i in $lecs
do
    title=$(sed -n 's/.*lecture{\([^}]*\)}.*/\1/p' $HOME/notes/current-notes/lec_"$i".tex)
    if [ "$1" == "$i. $title" ]
    then
        killall rofi
        sed -i "s/^% \\\\\input{lec_$(printf '%02d' $i).tex}/\\\\\input{lec_$(printf '%02d' $i).tex}/g" "$HOME/notes/current-notes/main.tex"
        for (( j=1; j <= $last ; j++ ))
        do
            if [ $((j)) != $((i)) ]
            then
                sed -i "s/^\\\\\input{lec_$(printf '%02d' $j).tex}/% \\\\\input{lec_$(printf '%02d' $j).tex}/g" "$HOME/notes/current-notes/main.tex"
            fi
        done
        latexmk -output-directory="$HOME/notes/current-notes/" "$HOME/notes/current-notes/main.tex" > /dev/null
        pdflatex -output-directory="$HOME/notes/current-notes/" "$HOME/notes/current-notes/main.tex" > /dev/null
        zathura $HOME/notes/current-notes/main.pdf
    fi
done

# rofi menu

echo "last"
echo "all"
for i in $lecs
do
    title=$(sed -n 's/.*lecture{\([^}]*\)}.*/\1/p' $HOME/notes/current-notes/lec_"$i".tex)
    echo "$i. $title"
done
