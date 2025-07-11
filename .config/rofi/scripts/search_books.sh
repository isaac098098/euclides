#!/bin/bash

dir="/home/isaac09809/documents/academic/im/semestre_1/fundamentos_de_combinatoria/bib/"

if [[ -n "$1" ]]; then
    killall rofi
    book=$(find "$dir" -type f -name "$1" | head -n 1)
    zathura "$book" 2>/dev/null &
    exit 0
fi

find "$dir" -type f \( -iname "*.pdf" -o -iname "*.djvu" -o -iname "*.cbr" -o -iname "*.epub" \) | awk -F/ '!seen[$NF]++ {print $NF}' | sort -df

exit 0
