function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
   echo ""
}

while :
do
  countdown '25*60'
  zenity --info --text="Relax!"
  countdown '5*60'
  zenity --info --text="Back to work!"
done
