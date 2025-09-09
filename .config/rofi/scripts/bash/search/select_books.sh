#!/bin/bash

# select books directory

if [[ "$1" ]]
then
    case "$1" in
        "Fundamentals")
            dir="$HOME/notes/drawing/bib/fundamentals/"
        ;;
        "Figure")
            dir="$HOME/notes/drawing/bib/figure/"
        ;;
        "Value")
            dir="$HOME/notes/drawing/bib/value/"
        ;;
        "Calculus")
            dir="$HOME/documents/academic/im/guias/bib/calculo/"
        ;;
        "Linear Algebra")
            dir="$HOME/documents/academic/im/guias/bib/algebra_lineal"
        ;;
        "Guides")
            dir="$HOME/documents/academic/im/guias/guias/"
        ;;
        "Reading")
            dir="$HOME/documents/reading/"
        ;;
        "Graphics")
            dir="$HOME/documents/reading/cs/graphics/"
        ;;
        "Computers")
            dir="$HOME/documents/reading/cs/"
        ;;
        "All")
            dir="$HOME/documents/books/"
        ;;
    esac

    sed -i "3s|.*|dir=\"$dir\"|" $HOME/.config/rofi/scripts/bash/search/search_book.sh

    exit 0
else
    echo "Fundamentals"
    echo "Figure"
    echo "Value"
    echo "Calculus"
    echo "Linear Algebra"
    echo "Guides"
    echo "Reading"
    echo "Graphics"
    echo "Computers"
    echo "All"
    
    exit 0
fi
