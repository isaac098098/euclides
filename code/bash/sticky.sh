#!/bin/bash

id=$(xwininfo | grep "Window id:" | awk '{print $4}')
width=$(xwininfo | grep "Width:" | awk '{print $2}')
echo "$width"

if [ $id ]
then
    i3-msg "[id=$id] sticky toggle"
    i3-msg "[id=$id] resize set 390 410"
    # i3-msg "[id=$id] move absolute position $((1920-$width))px 0px"
    i3-msg "[id=$id] move absolute position $((1920-390))px 0px"
fi
exit 0
