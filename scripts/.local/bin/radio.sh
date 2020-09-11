#!/bin/bash

PID_LOCATION="$HOME/.cache/radio_pid"
PLAY_CMD="mpv --really-quiet"
CHANNEL_NAME="$1"

[ -f "$PID_LOCATION" ] && (kill -9 $(cat "$PID_LOCATION"); rm "$PID_LOCATION")


case "$CHANNEL_NAME" in
  "stop")
    exit 0
    ;;
  "p3")
    CHANNEL_URL="https://drradio3-lh.akamaihd.net/i/p3_9@143506/master.m3u8?playerid=dr.drc-audio-player.1.5.8&portalid=DR"
    ;;
  "p4")
    CHANNEL_URL="https://drradio3-lh.akamaihd.net/i/p4kobenhavn_9@143509/master.m3u8?playerid=dr.drc-audio-player.1.5.8&portalid=DR"
    ;;
  *)
    echo "Channel not found"
    exit -1
    ;;
esac

$PLAY_CMD "$CHANNEL_URL" & PID="$!"

echo "$PID" > "$PID_LOCATION"
