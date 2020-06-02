#!/bin/bash
function unlock() {
  if [ -z "$BW_SESSION" ]; then
    export BW_SESSION=`bw unlock --raw`
  fi
}

function findpass() {
  unlock
  bw list items --search "$@" | fx 'a => a.filter(i => i.login).map(i => `${i.id}: ${i.login.username}`).join(`
`)'
}

function getpassitem() {
  unlock
  ID=$1
  PASS=`bw get item "$ID" | fx "i => i.login.password"`
  echo "$PASS"
}

unlock

LINES=`findpass $@`
CHOISE=`echo "$LINES" | dmenu`

GUID="${CHOISE%%: *}"
PASS=`getpassitem "$GUID"`

echo $PASS | xsel -ib

function CLEAR_CLIPBOARD {
  sleep 30
  if [ "`xsel --clipboard`" == "$PASS" ]; then
    echo "Password removed from clipboard"
    echo "x" | xsel -ib
  fi
}

CLEAR_CLIPBOARD &
