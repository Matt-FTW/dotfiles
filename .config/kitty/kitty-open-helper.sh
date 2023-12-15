#!/bin/sh
[ "$1" = @selection ] && set -- .
xdg-open "$1"
