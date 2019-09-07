#!/bin/bash
# Kill the touchpad
# Get the id number of the touchpad.
tp_id=`xinput list | grep -i touchpad | awk '{ print $5 }' | sed 's/id=//'`


# Find out whether the touchpad is enabled or not.
tp_enabled=`xinput list-props $tp_id | grep Device\ Enabled | awk '{ print $4 }'`


if [ $tp_enabled = 1 ]
then
  # The touchpad is currently enabled, so turn it off.
  xinput set-prop $tp_id "Device Enabled" 0
  notify-send 'Touchpad Disabled. Fn+F9 to enable.'
fi
