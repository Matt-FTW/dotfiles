#!/bin/sh

swaylock --screenshots --clock --indicator-idle-visible \
	--indicator-radius 100 \
	--indicator-thickness 12 \
	--ignore-empty-password \
	--ring-color 494d64 \
	--key-hl-color ed8796 \
	--text-color b7bdf8 \
	--line-color b7bdf8 \
	--inside-color 24273a \
	--separator-color b7bdf8 \
	--inside-ver-color 8bd5ca \
	--inside-wrong-color ed8796 \
	--line-ver-color 8bd5ca \
	--ring-ver-color 8bd5ca \
	--line-wrong-color ed8796 \
	--ring-wrong-color ed8796 \
	--fade-in 0.5 \
	--effect-scale 0.5 --effect-blur 7x3 --effect-scale 2 \
	--effect-vignette 0.5:0.9 \
	"$@"
