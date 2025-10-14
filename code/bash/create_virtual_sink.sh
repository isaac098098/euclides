#!/bin/bash

pactl load-module module-null-sink sink_name=virtual_sink sink_properties=device.description="obs_music"
