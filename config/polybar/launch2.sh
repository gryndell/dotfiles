#!/usr/bin/env bash

# Set Monitor
# MONITOR2=$(polybar -m | grep 'HDMI' | sed -e 's/:.*$//g')
MONITOR2=HDMI-1-2
export MONITOR2

# Terminate already running bar instances
# killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar -c $HOME/.config/polybar/config2 mybar2 &

echo "Polybar launched..."
