#!/bin/bash

mapfile -t files < <(ls . | grep -E '\.rar$' | sed 's/\.rar$//')

for file in "${files[@]}"
do
    echo "$file".rar
    unrar x "$file".rar
done
