#!/bin/bash

mapfile -t files < <(ls . | grep -E '\.7z$' | sed 's/\.7z$//')

for file in "${files[@]}"
do
    echo "$file".7z
    7z x "$file".7z
done
