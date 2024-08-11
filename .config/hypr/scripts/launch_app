#!/bin/bash

if [ -z "$1" ]; then
  exit 1
fi

program="$1"

if ! command -v "$program" >/dev/null 2>&1; then
  notify-send "Program not found" "Make sure you have installed $program"
  exit 1
else
  exec $program
fi
