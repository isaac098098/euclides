#!/bin/bash

# select books directory

if [[ "$1" ]]
then
    case "$1" in
        "Fundamentals")
            dir="$HOME/documents/comm/resources/books/fundamentals/"
        ;;
        "Figure")
            dir="$HOME/documents/comm/resources/books/figure/"
        ;;
        "Value")
            dir="$HOME/documents/comm/resources/books/value/"
        ;;
        "Manga")
            dir="$HOME/documents/comm/resources/books/manga/"
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
            dir="$HOME/documents/books/backup/cs/graphics/opengl/"
        ;;
        "Vulkan")
            dir="$HOME/documents/books/backup/cs/graphics/vulkan/"
        ;;
        "Graphics")
            dir="$HOME/documents/books/backup/cs/graphics/theory/"
        ;;
        "Mathematics")
            dir="$HOME/documents/books/sciences/math/"
        ;;
        "Reading")
            dir="$HOME/documents/reading/"
        ;;
        "Computers")
            dir="$HOME/documents/backup/cs/"
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
    echo "Mathematics"
    echo "Reading"
    echo "Computers"
    echo "All"
    
    exit 0
fi
