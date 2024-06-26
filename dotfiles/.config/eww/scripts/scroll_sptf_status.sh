#!/bin/bash

# see man zscroll for documentation of the following parameters
zscroll -r 60 \
        --delay 0.3 \
        --scroll-padding " - " \
        --match-command "`dirname $0`/get_sptf_status.sh --status" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true "`dirname $0`/get_sptf_status.sh" &

wait

