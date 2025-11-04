#!/bin/bash

mapfile -t files < <(ls . | grep -E '\.zip$' | sed 's/\.zip$//')

for file in "${files[@]}"
do
    echo "$file".zip
    unzip "$file".zip
done
