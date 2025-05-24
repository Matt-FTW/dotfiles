#!/bin/bash

if ! command -v cliphist >/dev/null 2>&1; then
  notify-send "Program not found" "Make sure you have installed cliphist"
  exit 1
else
  set -e

  selection="$(cliphist list | rofi -dmenu -i)"
  cliphist decode <<<"$selection" | wl-copy
fi
