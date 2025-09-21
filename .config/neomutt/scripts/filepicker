#!/bin/sh

tmpfile=$HOME/.config/neomutt/tmpfile

if \[ -z "$1" \]; then
  yazi --chooser-file $tmpfile &&
    sed -i 's/ /^V /g' $tmpfile &&
    echo "$(awk 'BEGIN {printf "%s", "push "} {printf "%s", "<attach-file>\""$0"\"<enter>"}' $tmpfile)" >$tmpfile
elif \[ $1 == "clean" \]; then
  rm $tmpfile
fi
