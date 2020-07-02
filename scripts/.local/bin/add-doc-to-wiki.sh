#!/bin/bash

URL="$1"
LOCATION="$2"

curl -sL "$URL" | pandoc --from html --to markdown_strict-raw_html -o "$HOME/wiki/$LOCATION" --extract-media=media
