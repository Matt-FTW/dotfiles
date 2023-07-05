#!/bin/sh

swayidle -w -d \
	timeout 600 '~/.config/sway/lock.sh -f --grace 12 --fade-in 10' \
	before-sleep 'pgrep swaylock || ~/.config/sway/lock.sh -f --fade-in 0 && true'
