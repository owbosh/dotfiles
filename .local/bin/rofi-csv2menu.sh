#!/bin/sh

MAP="$HOME/.config/rofi/csv/$1.csv"
[ ! -f $MAP ] && exit 1

cat "$MAP" \
    | cut -d ',' -f 1 \
    | rofi -dmenu -i -no-show-icons -p $1 \
    | head -n 1 \
    | xargs -i --no-run-if-empty grep "{}" "$MAP" \
    | cut -d ',' -f 2 \
    | head -n 1 \
    | xargs -i --no-run-if-empty /bin/sh -c "{}"

exit 0