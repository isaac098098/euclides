#!/bin/bash

if [ ! -s ~/.config/mpd/pid ]
    mpd &

exit 0
