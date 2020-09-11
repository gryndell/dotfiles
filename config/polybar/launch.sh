#!/usr/bin/env bash

# Set Monitor
MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g')
export MONITOR

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch
for MONITOR in $(polybar --list-monitors | cut -d':' -f1); do
  if [[ $MONITOR == *"DP-1"* ]]; then
    TRAY_POSITION=right MONITOR=$MONITOR polybar --reload mybar &
  else
    MONITOR=$MONITOR polybar --reload mybar &
  fi
done
# TRAY_POSITION=right MONITOR=$MONITOR polybar --reload mybar &

echo "Polybar launched..."
