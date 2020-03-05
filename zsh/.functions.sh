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

