#!/bin/bash

# requires ffmpeg, time-fmt.sh and time-int.sh

if [ $# -eq 1 ]; then

	if [ ! -d ./cropped ]; then
		mkdir -p ./cropped
	fi

	while read -r -u 3 line
    do
		read -r source init fin name <<< "$line"

        ffmpeg                                  \
            -loglevel error                     \
            -progress pipe:1                    \
            -hide_banner                        \
            -hwaccel cuda                       \
            -ss $(./time-fmt.sh "$init")        \
            -i ./"$source"                      \
            -t $(./time-int.sh "$init" "$fin")  \
            -map 0:v:0                          \
            -map 0:a?                           \
            -vf scale=1920:-1                   \
            -c:v hevc_nvenc                     \
            -preset p5                          \
            -rc vbr_hq                          \
            -cq 25                              \
            -b:v 0                              \
            -maxrate 4M                         \
            -bufsize 8M                         \
            -c:a copy                           \
            ./cropped/"$name".mkv |             \

            while IFS='=' read -r key value
            do
                if [ "$key" = "out_time" ]
                then
                    printf "\r%s" "$value"
                fi
            done

        echo " $name.mkv"

	done 3<$1

	exit 0
fi
