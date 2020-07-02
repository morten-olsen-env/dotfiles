#!/bin/sh
set -e
#xset s off dpms 0 10 0
(
  shotgun /tmp/screen.png
)
i3lock --color=000000 --ignore-empty-password --show-failed-attempts --nofork -i /tmp/screen.png
#xset s off -dpms
feh --bg-fill ~/wallpaper.jpg
