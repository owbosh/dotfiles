#!/bin/sh

save_location="$HOME/img/maim"
mkdir -p $save_location
screenshot_path="$save_location/$(date +'%Y-%m-%d-%H%M%S').png"
maim --hidecursor --quiet --quality=3 --format='png' --select --highlight --color=0.85,0.87,0.91,0.2 "$screenshot_path" && {
    notify-send -i $screenshot_path "Screenshot saved and copied to clipboard" "<i>$screenshot_path</i>"
    xclip -selection clipboard -target 'image/png' -in "$screenshot_path"
}
