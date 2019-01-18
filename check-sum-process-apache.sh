ps aux | grep 'httpd' | awk '{print $6}' | wc -l
