#!/bin/bash
 
# THRESHOLD=100
THRESHOLD=300
ADDRTO="chainuwat2@siamdata.co.th"
SUBJECT="Close_wait State Check"
LOCKFILE="/tmp/close_wait_check"
LOGFILE="/var/log/close_wait_process.log"

SHOWIPCONNECTION=`netstat -tulnap | grep CLOSE_WAIT | awk '{print $4,$5}' |  sed 's/:/ /g'` 
NUMCLOSEWAIT=`netstat -anp | grep "CLOSE_WAIT" | wc -l`
echo "`date +'%Y-%m-%d %H:%M:%S %Z'` - ${NUMCLOSEWAIT}" >> ${LOGFILE}
 
if [[ ${NUMCLOSEWAIT} -gt ${THRESHOLD} ]]; then
    /etc/rc.d/init.d/httpd restart
    echo "Restart Apache.... Now. | The number of currently running close_wait state threads is ${NUMCLOSEWAIT}. | ${SHOWIPCONNECTION}" | mail -s "${SUBJECT} - Above Threshold" ${ADDRTO}
  fi
  
