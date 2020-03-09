#!/bin/bash

TARGET="$HOME/.backup"

function ADD_PATH {
  LOCATION=$1
  if [ -d $LOCATION ]; then
    TARGET_DIR="$LOCATION"
  elif [ -f $LOCATION ]; then
    TARGET_DIR=`dirname $LOCATION`
  else
    echo "invalid"
    exit 1
  fi

  TARGET_DIR="$TARGET`realpath $TARGET_DIR`"
  mkdir -p "$TARGET_DIR"
  rsync -aog "$LOCATION" "$TARGET_DIR"
}

ADD_PATH /etc/pkglist.txt
ADD_PATH /etc/pacman.d/hooks/pkglist.hook
ADD_PATH /etc/ssh/sshd_config
ADD_PATH /etc/systemd/system/verdaccio.service
ADD_PATH /etc/X11/xorg.conf.d/45-libinput-touchpad.conf

rsync -zza "$TARGET/" "gaia:~/.backup/$HOSTNAME/"

