#!/bin/bash
set -e

GITHUB_USER="morten-olsen"
GIST_ID="acc9dfc0fe73a0f4815777a328aca284"
USER=alice

GITHUB_URL="https://gist.githubusercontent.com/$GITHUB_USER/$GIST_ID/raw"
KEY_URL="$GITHUB_URL/authorized_keys"
SIGNATURE_URL="$GITHUB_URL/signature.asc"
KEY="$(curl -s $KEY_URL)"

function sign() {
  SIGNATURE=$(echo "$KEY" | gpg --detach-sign --armor)
  echo "$SIGNATURE"
  echo "$SIGNATURE" | xsel -ib
}

function update() {
  SIGNATURE="$(curl -s $SIGNATURE_URL)"
  TMPLOC=$(mktemp)
  TMPSIGLOC=$(mktemp)
  echo "$KEY" > $TMPLOC
  echo "$SIGNATURE" > $TMPSIGLOC
  gpg --verify $TMPSIGLOC $TMPLOC
  mv $TMPLOC /home/$USER/.ssh/authorized_keys
  chmod 600 /home/$USER/.ssh/authorized_keys
}

case "$1" in
  update)
    update
    ;;
  sign)
    sign
    ;;
esac
