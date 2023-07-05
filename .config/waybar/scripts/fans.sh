#!/usr/bin/env bash
echo "$(cat /sys/devices/platform/asus-nb-wmi/hwmon/hwmon[[:print:]]*/fan1_input) RPM  "
