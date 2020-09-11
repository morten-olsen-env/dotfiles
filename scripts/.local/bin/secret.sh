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

function _edit {
  CONTENT=$(_get_content)
  OUTPUT=$(echo "$CONTENT" | vipe)
  echo "$OUTPUT" | gpg --user "$GPG_KEY" --recipient "$GPG_KEY" -o "$SECRET_FILE" --encrypt 
  chmod 600 "$SECRET_FILE"
}

function _run {
  CONTENT=$(_get_content)
  export $(echo $CONTENT | xargs)
  eval "$@"
}

function _add {
  CONTENT=$(_get_content)
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
