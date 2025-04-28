#!/bin/bash

wallpapers_dir="$HOME/.config/hypr/theme/walls/"

build_theme() {
  rows=$1
  cols=$2
  icon_size=$3

  echo "element{orientation:vertical;}element-text{horizontal-align:0.5;}element-icon{size:$icon_size.0000em;}listview{lines:$rows;columns:$cols;}"
}

theme="$HOME/.config/rofi/scripts/wallpaper/style.rasi"

rofi_cmd="rofi -dmenu -i -show-icons -theme-str $(build_theme 4 3 12) -theme ${theme}"

choice=$(
  ls --escape "$wallpapers_dir" |
    while read A; do echo -en "$A\x00icon\x1f$wallpapers_dir/$A\n"; done |
    $rofi_cmd
)

if [ -z "$choice" ]; then
  exit 1
fi

WALLPAPER="$wallpapers_dir/$choice"

if pgrep -x "hyprpaper" >/dev/null; then
  hyprctl hyprpaper reload ,"$WALLPAPER" && notify-send "Wallpaper Changed" -i "$WALLPAPER" --app-name=Wallpaper
elif pgrep -x "swww" >/dev/null; then
  swww img "$WALLPAPER" \
    --transition-bezier 0.5,1.19,.8,.4 \
    --transition-type wipe \
    --transition-duration 2 \
    --transition-fps 75 && notify-send "Wallpaper Changed" -i "$WALLPAPER" --app-name=Wallpaper
fi

exit 1
