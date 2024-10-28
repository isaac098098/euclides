#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar background 2>&1 | tee -a /tmp/polybar1.log & disown
sleep 0.1
polybar workspaces 2>&1 | tee -a /tmp/polybar1.log & disown
polybar music 2>&1 | tee -a /tmp/polybar1.log & disown
polybar info 2>&1 | tee -a /tmp/polybar1.log & disown
polybar utilities 2>&1 | tee -a /tmp/polybar1.log & disown
polybar hour 2>&1 | tee -a /tmp/polybar1.log & disown
polybar date 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
