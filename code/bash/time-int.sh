#!/usr/bin/env bash

to_seconds() {
    if [[ $1 =~ ^([0-9]+):([0-9]+)$ ]]; then
        echo $((10#${BASH_REMATCH[1]}*60 + 10#${BASH_REMATCH[2]}))
    elif [[ $1 =~ ^([0-9]+):([0-9]+):([0-9]+)$ ]]; then
        echo $((10#${BASH_REMATCH[1]}*3600 + 10#${BASH_REMATCH[2]}*60 + 10#${BASH_REMATCH[3]}))
    else
        echo "invalid time format: $1" >&2
        exit 1
    fi
}

[ $# -eq 2 ] || {
    echo "Usage: $0 [start] [end] (HH:MM:SS or MM:SS)" >&2
    exit 1
}

start=$(to_seconds "$1")
end=$(to_seconds "$2")

(( end < start )) && {
    echo "inconsistent interval" >&2
    exit 1
}

diff=$((end - start))

printf "%02d:%02d:%02d.00\n" \
    $((diff / 3600)) \
    $(((diff % 3600) / 60)) \
    $((diff % 60))
