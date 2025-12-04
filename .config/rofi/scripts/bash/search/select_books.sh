#!/bin/bash

# select books directory

if [[ "$1" ]]
then
    case "$1" in
        "Fundamentals")
            dir="$HOME/documents/books/backup/drawing_bib/fundamentals/"
        ;;
        "Figure")
            dir="$HOME/documents/books/backup/drawing_bib/figure/"
        ;;
        "Value")
            dir="$HOME/documents/books/backup/drawing_bib/value/"
        ;;
        "Manga")
            dir="$HOME/documents/books/backup/drawing_bib/manga/"
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
        "OpenGL")
            dir="$HOME/documents/books/backup/cybersecurity_bib/graphics/opengl/"
        ;;
        "Vulkan")
            dir="$HOME/documents/books/backup/cybersecurity_bib/graphics/vulkan/"
        ;;
        "Graphics")
            dir="$HOME/documents/books/backup/cybersecurity_bib/graphics/theory/"
        ;;
        "Learning")
            dir="$HOME/documents/reading/learning/"
        ;;
        "Mathematics")
            dir="$HOME/documents/books/sciences/math/"
        ;;
        "Reading")
            dir="$HOME/documents/reading/"
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
    echo "Combinatorics"
    echo "Graph Theory"
    echo "Algebraic Topology"
    echo "Abstract Algebra"
    echo "Category Theory"
    echo "OpenGL"
    echo "Vulkan"
    echo "Graphics"
    echo "Learning"
    echo "Mathematics"
    echo "Reading"
    echo "All"
    
    exit 0
fi
