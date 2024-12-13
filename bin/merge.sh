#!/bin/bash

if [ $# == 1 ]; then
    if [ ! -d ./merged ]; then
        mkdir -p ./merged
    fi
    while read -u 3 line; do
        read source name <<< $line
        if [ "$name" == "" ]; then
            echo "filename must be provided"
            exit 1
        else
            yt-dlp -o "./merged/temp_v.%(ext)s" $source 
            yt-dlp -x -o "./merged/temp_a.%(ext)s" $source 
            vid_ext=$(ls ./merged/temp_v* | awk -F. '{print $NF}')
            au_ext=$(ls ./merged/temp_a* | awk -F. '{print $NF}')
            ffmpeg -hide_banner -loglevel error -i ./merged/temp_v."$vid_ext" -i ./merged/temp_a."$au_ext" -c copy ./merged/"$name".mp4
            rm ./merged/temp_v."$vid_ext"
            rm ./merged/temp_a."$au_ext"
            echo "$name.mp4"
        fi
    done 3<$1
    exit 1
fi
