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
        "Manga")
            dir="$HOME/notes/drawing/bib/manga/"
        ;;
        "Vim")
            dir="$HOME/documents/projects/visnp/bib/"
        ;;
        "Combinatorics")
            dir="$HOME/documents/academic/im/semestre_1/combinatorics/"
        ;;
        "Graph Theory")
            dir="$HOME/documents/academic/im/semestre_1/graph_theory/"
        ;;
        "Algebraic Topology")
            dir="$HOME/documents/academic/im/semestre_1/algebraic_topology/bib/"
        ;;
        "Abstract Algebra")
            dir="$HOME/documents/academic/im/semestre_1/abstract_algebra/bib/"
        ;;
        "Category Theory")
            dir="$HOME/documents/academic/im/semestre_1/category_theory/bib/"
        ;;
        "Mathematics")
            dir="$HOME/documents/books/sciences/math/"
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
    echo "Manga"
    echo "Vim"
    echo "Combinatorics"
    echo "Graph Theory"
    echo "Algebraic Topology"
    echo "Abstract Algebra"
    echo "Category Theory"
    echo "Mathematics"
    echo "Reading"
    echo "Graphics"
    echo "Computers"
    echo "All"
    
    exit 0
fi
