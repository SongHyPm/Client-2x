ulimit -n 65535
if ps aux | grep -i "./ShareMemory" | grep -v grep >/dev/null 2>&1;then
  echo " ShareMemory  is running !!!!!!"
else
  ###### start ShareMemory ######
  cd /home/tlbb/Server/ 
  ./shm clear >/dev/null 2>&1
  rm -rf exit.cmd quitserver.cmd
  #echo -e "\n"
  ./shm start >/dev/null 2>&1
  #echo -e "\n"
  echo " start ShareMemory ......"

  #until  [ "$STATUS" ]
  #FILE=`ls -l -lt /home/tlbb/Server/Log/ShareMemory* | head -n 1 | awk '{print$9}' `
  #do
  #  STATUS=`tail -1 $FILE | grep "Loop...Start" | egrep -vi 'grep|tail' ` 
  #done
  
  sleep 30
  echo " ShareMemory started completely !!!!!!"

  ###### start World ######
  cd /home/tlbb/Server/ 
  ./World >/dev/null 2>&1 &
  echo " start World ......"
  sleep 5
  echo " World started completely !!!!!!"

  ###### start Login ######
  ./Login >/dev/null 2>&1 &
  echo " start Login ......"
  sleep 1
  echo " Login started completely !!!!!!"

  ###### start Server ######
  cd /home/tlbb/Server/
    ./Server >/dev/null 2>&1 &
  echo " start Server ......"

  #until
  #[ "$?" = "1" ]
  #do
  #  ps aux | grep -i "./Server -loadscriptonce" | grep -v grep >/dev/null 2>&1
  #done

  sleep 60
  echo " Server started completely !!!!!!"

  ###### start Billing ######
  cd /home/tlbb/Billing/ 
  wine "Billing.exe" >/dev/null 2>&1 &
  echo " start Billing ......"
  sleep 5
  echo "!!!!!! Click the first Button on the Opened Billing in GUI !!!!!!"
  exit
fi
