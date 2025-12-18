#!/usr/bin/env bash

[ $# -eq 1 ] || {
    echo "Usage: $0 [time] (HH:MM:SS or MM:SS)" >&2
    exit 1
}

if [[ $1 =~ ^([0-9]+):([0-9]+)$ ]]; then
    H=0
    M=$((10#${BASH_REMATCH[1]}))
    S=$((10#${BASH_REMATCH[2]}))
elif [[ $1 =~ ^([0-9]+):([0-9]+):([0-9]+)$ ]]; then
    H=$((10#${BASH_REMATCH[1]}))
    M=$((10#${BASH_REMATCH[2]}))
    S=$((10#${BASH_REMATCH[3]}))
else
    echo "invalid time format: $1" >&2
    exit 1
fi

(( M < 60 && S < 60 )) || {
    echo "inconsistent time format" >&2
    exit 1
}

printf "%02d:%02d:%02d.00\n" "$H" "$M" "$S"
