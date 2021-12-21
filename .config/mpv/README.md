# My [mpv](https://github.com/mpv-player/mpv) configs and scripts
![screenshot](https://raw.githubusercontent.com/owbosh/owbosh.github.io/main/resources/mpv-scrot.png)
mpv configs to match my desktop rice and behavior adjustments to suit my needs.

## Wowza, colors!
I changed the osc.lau colors to better match my desktop rice. This can be toggled off by changing `colorosc` in `script-opts/osc.conf`.

## Pause on seek
By default, mpv does not pause playback when scrubbing the seek bar. There's no options to change this behavior in the upstream mpv, so I added the setting myself by modifying osc.lau. The setting is `seekpause` in `script-opts/osc.conf`.

## Autoload
`autoload.lua` is a nice script that automatically loads all video files in the current directory when you open one video in mpv. The videos are added to mpv's queue/playlist.

## Other notes
* GPU decoding is on by default
* gifs automatically loop
* Permanently visible osc
* Videos can be scaled down to fit inside a smaller window, but will not scale up beyond their native resolution

## Installation
Just clone this repo to `~/.config`. mpv looks for config files in `~/.config/mpv`.