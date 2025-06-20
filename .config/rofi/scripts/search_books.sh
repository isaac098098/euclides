#!/bin/bash

dir="/home/isaac09809/documents/academic/esfm/tesis/tesis_bib"

if [[ -n "$1" ]]; then
    killall rofi
    book=$(find "$dir" -type f -name "$1")
    zathura "$book" &
    exit 0
fi

find "$dir" -type f -printf "%f\n" | grep .pdf
