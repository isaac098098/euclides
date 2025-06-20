#!/bin/bash

# select books directory

if [[ "$1" ]]
then
    case $1 in
        "Algebraic Topology")
            dir="$HOME/documents/academic/cinvestav/semestre_1/topologia/"
        ;;
        "Complex Variables")
            dir="$HOME/documents/academic/cinvestav/semestre_1/variable_compleja/"
        ;;
        "Drawing")
            dir="$HOME/documents/books/manuals/drawing"
        ;;
        "Tesis")
            dir="$HOME/documents/academic/esfm/tesis/tesis_bib"
        ;;
        "Analysis")
            dir="$HOME/documents/academic/cinvestav/semestre_1/aux_bib/analysis/"
        ;;
        "Algebra")
            dir="$HOME/documents/academic/cinvestav/semestre_1/aux_bib/algebra/"
        ;;
        "General Mathematics")
            dir="$HOME/documents/books/sciences/math"
        ;;
        "All")
            dir="$HOME/documents/books/"
        ;;
    esac

    sed -i "3s|.*|dir=\"$dir\"|" $HOME/.config/rofi/scripts/search_books.sh

    exit 0
else
    echo "Algebraic Topology"
    echo "Complex Variables"
    echo "Drawing"
    echo "Tesis"
    echo "Analysis"
    echo "Algebra"
    echo "General Mathematics"
    echo "All"
    
    exit 0
fi
