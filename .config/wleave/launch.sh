#!/usr/bin/env bash

LAYOUT="$HOME/.config/wleave/layout"
STYLE="$HOME/.config/wleave/style.css"

if [[ ! $(pidof wlogout) ]]; then
    wleave --layout ${LAYOUT} --css ${STYLE} \
        --buttons-per-row 2 \
        --column-spacing 50 \
        --row-spacing 50 \
        --margin-top 290 \
        --margin-bottom 290 \
        --margin-left 300 \
        --margin-right 300
else
    pkill wleave
fi
