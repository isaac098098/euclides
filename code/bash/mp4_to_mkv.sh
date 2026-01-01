#!/bin/bash

if [ ! -d ./converted ]
then
    mkdir -p ./converted
fi

mapfile -t files < <(ls . | grep -E '\.mp4$' | sed 's/\.mp4$//')

total=${#files[@]}
count=0

for file in "${files[@]}"
do
    ffmpeg                              \
    -loglevel error                     \
    -progress pipe:1                    \
    -hide_banner                        \
    -hwaccel cuda                       \
    -i ./"$file".mp4                    \
    -map 0:v:0                          \
    -map 0:a?                           \
    -c:v hevc_nvenc                     \
    -preset p5                          \
    -rc vbr_hq                          \
    -cq 30                              \
    -b:v 0                              \
    -maxrate 4M                         \
    -bufsize 8M                         \
    -c:a copy                           \
    ./converted/"$file".mkv |           \

    while IFS='=' read -r key value
    do
        if [ "$key" = "out_time" ]
        then
            printf "\r%s" "$value"
        fi
    done

    ((count++))
    printf " %s.mkv (%04d/%04d)\n" "$file" "$count" "$total"
done
