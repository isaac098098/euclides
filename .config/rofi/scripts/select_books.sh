#!/bin/bash

# select books directory

if [[ "$1" ]]
then
    case "$1" in
        "Fundamentals")
            dir="$HOME/notes/current-notes/bib/fundamentals"
        ;;
        "Figure")
            dir="$HOME/notes/current-notes/bib/figure"
        ;;
        "Manga")
            dir="$HOME/notes/current-notes/bib/manga"
        ;;
        "Color")
            dir="$HOME/notes/current-notes/bib/color"
        ;;
        "Reading")
            dir="$HOME/documents/reading/"
        ;;
        "Graphics")
            dir="$HOME/documents/reading/graphics/"
        ;;
        "All")
            dir="$HOME/documents/books/"
        ;;
    esac

    sed -i "3s|.*|dir=\"$dir\"|" $HOME/.config/rofi/scripts/search_book.sh

    exit 0
else
    echo "Fundamentals"
    echo "Figure"
    echo "Manga"
    echo "Color"
    echo "Reading"
    echo "Graphics"
    echo "All"
    
    exit 0
fi
