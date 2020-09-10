SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

function fail {
  echo $1; exit ${2:-'-1'}
}

SCRIPT_LOCATION=$(realpath "$SOURCE")
FILE_NAME="$(basename $SCRIPT_LOCATION)"

PRODUCT_NAME="$FILE_NAME"
CONFIG_FILE_NAME=".$PRODUCT_NAME.config"
LAUNCH_FILE=$(echo "$PRODUCT_NAME" | shasum | awk '{print $1}')

[ -e "$PWD/$CONFIG_FILE_NAME" ] \
  && source "$PWD/$CONFIG_FILE_NAME" \
  || fail "No configuration found at $PWD/$CONFIG_FILE_NAME" 3

HELP="
USAGE: $PRODUCT_NAME <command> [args]

COMMANDS:
- help: current help screen
- deploy: deploy current project to server
- destory: remove project from server
- run: run a command on the server
- shell: open a shell on the server
- disconnect: close connection to server
- connected: display is connected to server
- edit-self: open $PRODUCT_NAME script for editing
"

TMP_DIR="/tmp/$PRODUCT_NAME"
SERVER_SHA=$(echo "$TARGET_SERVER" | shasum | awk '{print $1}')
SSH_SOCKET="$TMP_DIR/$SERVER_SHA"
SSHCMD="/usr/bin/ssh -o ControlPath=$SSH_SOCKET"

[ $# -eq 0 ] && fail "No command provided"
COMMAND="$1"; shift

case "$COMMAND" in
  "help") echo "$HELP"; exit ;;
  "edit-self") $EDITOR $SCRIPT_LOCATION; exit ;;
esac

[ -z "$TARGET_SERVER" ] && fail "No target server specified"
[ -z "$TARGET_PATH" ] && fail "No target path specified"

mkdir -p "$TMP_DIR"

function _is_connected {
  $SSHCMD -O check foo &> /dev/null
}

function _disconnect {
  _is_connected && $SSHCMD -O exit foo
}

function _connect {
  _is_connected || $SSHCMD -fNTM "$TARGET_SERVER"
  $SSHCMD "$TARGET_SERVER" mkdir -p "$TARGET_PATH"
}

function _target {
  _connect
  $SSHCMD "$TARGET_SERVER" cd "$TARGET_PATH"\; $@
}

function _copy {
  _connect
  rsync -e "$SSHCMD" -aHAX --delete-after \
    --filter=":e- .gitignore" --filter "- .git/" \
    "$1" "$TARGET_SERVER:$2"
}

function _deploy {
  [ -z "$PRE_DEPLOY" ] || _target $PRE_DEPLOY
  _copy "$PWD/" "$TARGET_PATH"
  _target touch "$TARGET_PATH/.$LAUNCH_FILE"
  [ -z "$POST_DEPLOY" ] || _target $POST_DEPLOY
  [ $# -ne 0 ] && _target $@
}

function _destroy {
  _target [ -f "$TARGET_PATH/.$LAUNCH_FILE" ] \
    || fail "not deployed by $PRODUCT_NAME; will not destroy" 4

  [ -z "$PRE_DESTROY_COMMAND" ] || _target $PRE_DESTROY_COMMAND
  _target rm -rf "$TARGET_PATH"
  [ -z "$POST_DESTROY_COMMAND" ] || _target $POST_DESTROY_COMMAND
  [ $# -ne 0 ] && _target $@
  _disconnect
}

function _check_connection {
  _is_connected && echo "connected ($SSH_SOCKET)" || fail "disconnected"
}

function _shell {
  $SSHCMD $@ "$TARGET_SERVER"
}

function _command {
  case "$COMMAND" in
    "shell") _shell $@ ;;
    "run") _target $@ ;;
    "deploy") _deploy $@ ;;
    "destroy") _destroy $@ ;;
    "disconnect") _disconnect ;;
    "connected") _check_connection ;;
    *) echo "unknown command"; exit -1 ;;
  esac
}

_command $@

