#/!bin/sh

function unlock() {
  if [ -z "$BW_SESSION" ]; then
    export BW_SESSION=`bw unlock --raw`
  fi
}

function getpass() {
  unlock
  PASS=`bw get password $1`
  echo "$PASS"
}

function getpassitem() {
  unlock
  ID=$1
  PASS=`bw get item "$ID" | fx "i => i.login.password"`
  echo "$PASS"
}

function findpass() {
  unlock
  bw list items --search "$@" | fx 'a => a.filter(i => i.login).map(i => `${i.id}: ${i.login.username}`).join(`
`)'
}

function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
   echo ""
}
function stopwatch(){
  date1=`date +%s`; 
   while true; do 
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
    sleep 0.1
   done
   echo ""
}

function manwww() {
	curl -skL "$*" | pandoc -s -f html -t man | man -l -
}

function md() {
    pandoc -s -f markdown -t man "$*" | man -l -
}

function short() {
  curl -F"shorten=$*" https://0x0.st
}

function git-tree {
    # tree respecting gitignore

    local ignored=$(git ls-files -ci --others --directory --exclude-standard)
    local ignored_filter=$(echo "$ignored" \
                    | egrep -v "^#.*$|^[[:space:]]*$" \
                    | sed 's~^/~~' \
                    | sed 's~/$~~' \
                    | tr "\\n" "|")
    tree --prune -I ".git|${ignored_filter: : -1}" "$@"
}

