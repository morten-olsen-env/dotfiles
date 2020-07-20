#!/bin/bash
find . -type f \( -name '*.mkv' -o -name '*.mp4' -o -name '*.avi' \) | shuf -n 1 | xargs -0 realpath | tr -d '\n' | xargs -0 mpv
