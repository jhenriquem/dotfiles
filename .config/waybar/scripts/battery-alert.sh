#!/bin/bash

capacity=$(cat /sys/class/power_supply/BAT?/capacity)

if [ "$capacity" -le 20 ]; then
    notify-send " ⚠️ Bateria fraca" "Restam apenas $capacity%!"
fi

