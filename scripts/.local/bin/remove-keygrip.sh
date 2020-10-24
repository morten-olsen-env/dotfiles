#!/usr/bin/env bash
gpg-connect-agent "scd serialno" "learn --force" /bye
test ! "$@" && echo "Specify a key." && exit 1
KEYGRIPS="$(gpg --with-keygrip --list-secret-keys $@ | grep Keygrip | awk '{print $3}')"
for keygrip in $KEYGRIPS
do
    rm "$HOME/.gnupg/private-keys-v1.d/$keygrip.key" 2> /dev/null
done

gpg --card-status
