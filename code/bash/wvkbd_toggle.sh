#!/bin/bash
pid=$(ps axf | grep wvkbd-mobintl | grep -v grep | awk '{print $1}')
if [[ $pid ]]; then
    kill -s SIGRTMIN $pid
else
    wvkbd-mobintl -L "250" -fn "IosevkaNF Bold 18" --bg "11111b" --fg "313244" --fg-sp "181825" --press "585b70" --press-sp "45475a"
fi
