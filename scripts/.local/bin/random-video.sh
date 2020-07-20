#!/bin/bash

VIDEOS=`find . -type f \( -name '*.mkv' -o -name '*.mp4' -o -name '*.avi' \)`

function play_video {
  echo "$VIDEOS" | shuf -n 1 | xargs -0 realpath | tr -d '\n' | xargs -0 mpv --hwdec=vaapi
  play_video
}

play_video

