#!/bin/bash

dir="$HOME/zettelkasten/current"

card=$(echo "$1" | awk '{print $1}')
last_char=${card: -1}

if [[ "$last_char" =~ [0-9] ]]
then
has_sub=$(ls "$dir/cards" | sed -nE "s/^${card}([a-z])+\.tex/\1/p")
if [[ "$has_sub" ]]
then
    rofi -config "$HOME/.config/rofi/config.rasi" -e "card has subcards!"
    exit 0
else
    parent=$(echo "$card" | sed -E 's/([a-z]+)[0-9]+$/\1/p' | tail -n 1)
    if [[ "$parent" == "$card" ]]
    then
        rofi -config "$HOME/.config/rofi/config.rasi" -e "removing root cards is forbidden, do it manually!"
        exit 0
    else
        last=$(ls "$dir/cards" | sed -nE "s/^${parent}([0-9]+)\.tex/\1/p" | sort -n | tail -n 1)
        if [[ "$parent$last" == "$card" ]]
        then
            sed -i "/\\input{cards\/$card\.tex}/d" "$dir/main.tex"
            rm "$dir/cards/$card".*
            new_cards=$(ls "$dir/cards" | grep .tex | sort -V)
            for i in $new_cards
            do
                sed -i "s/\\\\hyperref\[card:$card\]{\\\\textsf{$card}}/\\\\texttt{broken hyperref}/" "$dir/cards/$i"
            done
            exit 0
        else
            rm "$dir/cards/$card".*
            sed -i "/\\input{cards\/$parent$last\.tex}/d" "$dir/main.tex"
            mv "$dir/cards/$parent$last.tex" "$dir/cards/$card.tex"
            sed -i -E "s|(\\zheader\{[^}]*\})\{[^}]+\}|\1{$card}|" "$dir/cards/$card.tex"
            sed -i -E "s|(\\zheadernotags\{[^}]*\})\{[^}]+\}|\1{$card}|" "$dir/cards/$card.tex"
            new_cards=$(ls "$dir/cards" | grep .tex | sort -V)
            for i in $new_cards
            do
                sed -i "s/\\\\hyperref\[card:$parent$last\]{\\\\textsf{$parent$last}}/\\\\hyperref[card:$card]{\\\\textsf{$card}}/" "$dir/cards/$i"
                sed -i "s/\\\\hyperref\[card:$card\]{\\\\textsf{$card}}/\\\\texttt{broken hyperref}/" "$dir/cards/$i"
            done
            exit 0
        fi
    fi
fi
elif [[ "$last_char" =~ [a-z] ]]
then
has_sub=$(ls "$dir/cards" | sed -nE "s/^${card}([0-9])+\.tex/\1/p")
if [[ "$has_sub" ]]
then
    rofi -config "$HOME/.config/rofi/config.rasi" -e "card has subcards!"
    exit 0
else
    parent=$(echo "$card" | sed -E 's/([0-9]+)[a-z]+$/\1/p' | tail -n 1)
    if [[ "$parent" == "$card" ]]
    then
        rofi -config "$HOME/.config/rofi/config.rasi" -e "removing root cards is forbidden, do it manually!"
        exit 0
    else
        last=$(ls "$dir/cards" | sed -nE "s/^${parent}([a-z]+)\.tex/\1/p" | awk '{print length, $0}' | sort -n | cut -d' ' -f2- | tail -n 1)
        if [[ "$parent$last" == "$card" ]]
        then
            sed -i "/\\input{cards\/$card\.tex}/d" "$dir/main.tex"
            rm "$dir/cards/$card".*
            new_cards=$(ls "$dir/cards" | grep .tex | sort -V)
            for i in $new_cards
            do
                sed -i "s/\\\\hyperref\[card:$card\]{\\\\textsf{$card}}/\\\\texttt{broken hyperref}/" "$dir/cards/$i"
            done
            exit 0
        else
            rm "$dir/cards/$card".*
            sed -i "/\\input{cards\/$parent$last\.tex}/d" "$dir/main.tex"
            mv "$dir/cards/$parent$last.tex" "$dir/cards/$card.tex"
            sed -i -E "s|(\\zheader\{[^}]*\})\{[^}]+\}|\1{$card}|" "$dir/cards/$card.tex"
            sed -i -E "s|(\\zheadernotags\{[^}]*\})\{[^}]+\}|\1{$card}|" "$dir/cards/$card.tex"
            new_cards=$(ls "$dir/cards" | grep .tex | sort -V)
            for i in $new_cards
            do
                sed -i "s/\\\\hyperref\[card:$parent$last\]{\\\\textsf{$parent$last}}/\\\\hyperref[card:$card]{\\\\textsf{$card}}/" "$dir/cards/$i"
                sed -i "s/\\\\hyperref\[card:$card\]{\\\\textsf{$card}}/\\\\texttt{broken hyperref}/" "$dir/cards/$i"
            done
            exit 0
        fi
    fi
fi
fi

$HOME/.config/rofi/scripts/c/zettelkasten/sort_cards "$dir/cards"
