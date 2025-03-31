#!/bin/bash

BATTERY_PATH="/sys/class/power_supply/BAT0"

if [ ! -d "$BATTERY_PATH" ]; then
    echo "No Battery"
    exit 1
fi

PERCENT=$(cat "$BATTERY_PATH/capacity")
STATUS=$(cat "$BATTERY_PATH/status")

ICON="Unk"  # Default icon (Unknown)

case "$STATUS" in
    "Charging") ICON="󰂄" ;;     # Charging icon
    "Discharging") ICON="󰁺" ;;  # Discharging icon
    "Full") ICON="󰁹" ;;        # Full battery icon
esac

echo "$ICON  $PERCENT%"

