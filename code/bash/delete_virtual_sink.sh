#!/bin/bash

pactl list short modules | grep module-null-sink | awk '{print $1}' | xargs -r -n1 pactl unload-module
