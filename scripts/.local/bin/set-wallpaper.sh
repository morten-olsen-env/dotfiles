#!/bin/bash

cp "$1" ~/.config/i3/wallpaper.jpg
feh --bg-fill ~/.config/i3/wallpaper.jpg
wal -c
wal -i ~/.config/i3/wallpaper.jpg -a 180
