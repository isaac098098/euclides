#!/usr/bin/env bash

vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F'/' '/Volume/ { gsub(/[^0-9]/, "", $2); print $2; exit }')
new_vol=$((vol + 5))

if (( new_vol > 100 )); then
  new_vol=100
fi

pactl set-sink-volume @DEFAULT_SINK@ ${new_vol}%
