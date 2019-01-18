#!/bin/bash
echo "mqueue count";
exim -bpc
echo "mqueue display";
exim -bp
echo "*********************************************************************************";
echo "Summary Process Apache";
ps aux | grep 'httpd' | awk '{print $6}' | wc -l
echo "*********************************************************************************";
echo "check script bot net";
ps -u apache | grep -v PID | grep -v httpd | gawk '{ print $1,$4 }'
echo "*********************************************************************************";
echo "check User Apache";
ps -aux |grep "apache"
echo "*********************************************************************************";
echo "find files is Suspicious.";
echo "*********************************************************************************";
echo "islamlib.net find user apache";
find /home/islamlib/domains/islamlib.net/public_html/ -type f -user apache |more
echo "*********************************************************************************";
echo "alwilayat.org find user apache";
echo "find /home/alwilaya/domains/alwilayat.org/public_html/ -name *.php -type f -user apache |more"
#echo "*********************************************************************************";
#echo "netstat grep Port 111";
#netstat -anp | grep ":111"
echo "*********************************************************************************";
echo "List Path: /home/islamlib/.php";
ls -lat /home/islamlib/.php/
echo "List File /home/islamlib/.php/php-mail.log";
ls -la /home/islamlib/.php/php-mail.log
echo "*********************************************************************************";
echo "Check Syn Flood";
netstat -ntu | grep SYN_RECV | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr
echo "*********************************************************************************";
echo "ss grep smtp";
ss | grep ":smtp"
echo "*********************************************************************************";
echo "find /home/eduexpl/domains/eduexplore.asia/public_html/ -type f -user apache -ctime -3 |more";
find /home/eduexpl/domains/eduexplore.asia/public_html/ -type f -user apache -ctime -3 |more
echo "find /home/immjourn/domains/immjournal.com/public_html/ -type f -user apache -ctime -3 |more";
find /home/immjourn/domains/immjournal.com/public_html/ -type f -user apache -ctime -3 |more
echo "find /home/brevill/domains/brevillethailand.com/public_html/ -type f -user apache -ctime -3 |more";
find /home/brevill/domains/brevillethailand.com/public_html/ -type f -user apache -ctime -3 |more
echo "find /home/almahdif/domains/mahditv.com/public_html/ -type f -user apache -ctime -3 |more";
find /home/almahdif/domains/mahditv.com/public_html/ -type f -user apache -ctime -3 |more
echo "find /home/cashda/domains/cash7day.com/public_html/ -type f -user apache -ctime -3 |more";
find /home/cashda/domains/cash7day.com/public_html/ -type f -user apache -ctime -3 |more
echo "find /home/k13/domains/klong13.com/public_html/ -type f -user apache -ctime -3 |more";
find /home/k13/domains/klong13.com/public_html/ -type f -user apache -ctime -3 |more
echo "find /home/justthai/domains/justthaihost.com/public_html/ -type f -user apache -ctime -3 |more";
find /home/justthai/domains/justthaihost.com/public_html/ -type f -user apache -ctime -3 |more
echo "find /home/bemedic/domains/bemedicare.com/public_html/ -type f -user apache -ctime -3 | more";
find /home/bemedic/domains/bemedicare.com/public_html/ -type f -user apache -ctime -3 | more

