#!/bin/bash

SECRET_FILE="$HOME/.secrets.gpg"
GPG_KEY="B99B3345"
ACTION="$1"; shift

function _get_content {
  CONTENT=""
  if [ -f "$SECRET_FILE" ]; then
    CONTENT=$(cat "$SECRET_FILE" | gpg -d -r "$GPG_KEY")
  fi
  echo "$CONTENT"
}

CONTENT=$(_get_content)

function _edit {
  echo "$CONTENT" | vipe | gpg --user "$GPG_KEY" --recipient "$GPG_KEY" -o "$SECRET_FILE" --encrypt 
  chmod 600 "$SECRET_FILE"
}

function _run {
  export $(echo $CONTENT | xargs)
  eval "$@"
}

function _add {
  echo "$CONTENT
$1=\"$2\"" | gpg --user "$GPG_KEY" --recipient "$GPG_KEY" -o "$SECRET_FILE" --encrypt
}

case "$ACTION" in
  "run")
    _run $@
    ;;
  "edit")
    _edit
    ;;
  "add")
    _add "$1" "$2"
    ;;
esac
