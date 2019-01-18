#!/bin/bash
 
THRESHOLD=200
ADDRTO="chainuwat2@siamdata.co.th"
SUBJECT="103.22.180.20 have mailqueue over quota [Check SPAM]"
 
NUMDEFERRED=`exim -bpc`
 
if [[ ${NUMDEFERRED} -gt ${THRESHOLD} ]]; then
    echo "103.22.180.20 have mailqueue over quota [Check SPAM] | The number of mailqueue is ${NUMDEFERRED}" | mail -s "${SUBJECT}" ${ADDRTO} | curl -X POST -H 'Authorization: Bearer OvvpfLIi0CdhPH0ofV3Xj8IkrzvneEjk4NfcDAp4GHz' -F 'message=Server 103.22.180.20 have mailqueue over quota [Check SPAM]' https://notify-api.line.me/api/notify
  fi
