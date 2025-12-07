#!/bin/bash

# 1. Get raw data from UPower
# (Adjust BAT0 to BAT1 if your system is different, but BAT0 is standard for Dell)
BAT_DATA=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)

# 2. Extract key metrics
# "capacity" = The % of original design capacity left (True Health)
# "energy-rate" = How fast it's charging/discharging (Charger Speed)
HEALTH=$(echo "$BAT_DATA" | grep "capacity:" | awk '{print $2}')
RATE=$(echo "$BAT_DATA" | grep "energy-rate:" | awk '{print $2, $3}')
STATE=$(echo "$BAT_DATA" | grep "state:" | awk '{print $2}')
VOLTAGE=$(echo "$BAT_DATA" | grep "voltage:" | awk '{print $2, $3}')
CYCLES=$(echo "$BAT_DATA" | grep "charge-cycles:" | awk '{print $2}')

# 3. Determine Icon based on state
if [ "$STATE" = "charging" ]; then
    ICON="battery-charging"
    MSG="Charging at $RATE"
else
    ICON="battery"
    MSG="Discharging at $RATE"
fi

# 4. Send the Notification
notify-send -u normal -i "$ICON" "Battery Health Report" \
"<b>Health:</b> $HEALTH (Original Capacity)
<b>Cycles:</b> $CYCLES
<b>Voltage:</b> $VOLTAGE
<b>Status:</b> $MSG"
