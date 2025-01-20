#!/bin/bash

id=$(xwininfo | grep "Window id:" | awk '{print $4}')

if [ $id ]
then
    i3-msg "[id=$id] resize set 1920 1080"
    exit 0
fi
