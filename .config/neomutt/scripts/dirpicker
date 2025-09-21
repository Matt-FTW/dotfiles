#!/bin/sh

tmpfile=$HOME/.config/neomutt/tmpdir

if \[ -z "$1" \]; then
  yazi --cwd-file $tmpfile &&
    echo "$(awk 'BEGIN {printf "%s", "push "} {printf "%s", "<save-entry>\""$0"\"<enter>"}' $tmpfile)" >$tmpfile
elif \[ $1 == "clean" \]; then
  rm $tmpfile
fi
