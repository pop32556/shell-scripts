echo 'connection for status ESTABLISHED summary';
netstat -ntu | grep ESTABLISHED | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr
echo 'connection for status TIME_WAIT summary';
netstat -ntu | grep TIME_WAIT | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr
echo 'Connections State Summary';
netstat -nat | awk '{print $6}' | sort | uniq -c | sort -n
echo 'process with the apache summary';
ps -aux |grep "httpd"  |wc -l
