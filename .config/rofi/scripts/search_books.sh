#!/bin/bash
dir="$HOME/documents/books/sciences/math"
#dir="$HOME/documents/academic/cinvestav/semestre_1"
#dir="$HOME/documents/academic/esfm/tesis/tesis_bib/books"
dir="$HOME/documents/comm/resources"
if [[ -n "$1" ]]; then
    killall rofi
    book=$(find "$dir" -type f -name "$1")
    zathura "$book" &
    echo "$book"
    exit 0
fi
find "$dir" -type f -printf "%f\n"
