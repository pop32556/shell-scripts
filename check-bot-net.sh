#!/bin/sh
CurrentDate=`date`
Hostname=`hostname`
DATAA=`ps -u apache | grep -v PID | grep -v httpd | gawk '{ print $1,$4 }'`
`ps -u apache | grep -v PID | grep -v httpd | gawk '{ print $1,$4 }' > /tmp/checkbota`
sleep 15
DATAB=`ps -u apache | grep -v PID | grep -v httpd | gawk '{ print $1,$4 }'`
`ps -u apache | grep -v PID | grep -v httpd | gawk '{ print $1,$4 }' > /tmp/checkbotb`
if [ -s /tmp/checkbota ] && [ -s /tmp/checkbotb ] && [ "$DATAA" == "$DATAB" ]; then
  DATAC=`ps -u apache | grep -v httpd`  
  echo "$DATAC" | mail -s "Alert Apache bot from $Hostname" chainuwat2@siamdata.co.th
  /root/kill-all-process-bot-perl.sh
  echo "Kill ALL Process bot perl" | mail -s "Alert Apache bot from $Hostname" chainuwat2@siamdata.co.th
fi

