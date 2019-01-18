#!/bin/bash
iptables -F
iptables -A INPUT -p tcp --syn -m limit --limit 25/s --limit-burst 30 -j ACCEPT
iptables -A INPUT -p tcp --syn -j DROP
iptables -A INPUT -s 217.168.134.86 -j DROP
iptables -A INPUT -s 204.12.255.130 -j DROP
#iptables -A INPUT -s -j DROP

