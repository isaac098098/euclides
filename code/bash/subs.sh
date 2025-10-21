#!/bin/bash

mapfile -t files < <(ls . | grep -E '\.mkv$' | sed 's/\.mkv$//')

for file in "${files[@]}"
do
    echo "$file.mkv"
    mkvextract tracks ./"$file.mkv" 4:tmp
    vobsub2srt tmp
    mv tmp.srt "$file.srt"
    rm tmp.idx tmp.sub
done
