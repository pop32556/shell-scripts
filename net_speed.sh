{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf830
{\fonttbl\f0\fswiss\fcharset0 ArialMT;}
{\colortbl;\red255\green255\blue255;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c100000\c100000\c100000;\cssrgb\c0\c0\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs26\fsmilli13120 \cf0 \cb2 \expnd0\expndtw0\kerning0
#!/bin/bash\cb1 \
\cb2 # This shell script shows the network speed, both received and transmitted.\cb1 \
\cb2 # Usage: net_speed.sh interface\cb1 \
\cb2 # e.g: net_speed.sh enp0s3 / eth0\cb1 \
\cb2 # Global variables\cb1 \
\cb2 interface=$1\cb1 \
\cb2 received_bytes=""\cb1 \
\cb2 old_received_bytes=""\cb1 \
\cb2 transmitted_bytes=""\cb1 \
\cb2 old_transmitted_bytes=""\cb1 \
\cb2 # This function parses /proc/net/dev file searching for a line containing $interface data.\cb1 \
\cb2 # Within that line, the first and ninth numbers after ':' are respectively the received and transmited bytes.\cb1 \
\cb2 get_bytes()\cb1 \
\cb2 \{\cb1 \
\cb2 line=$(cat /proc/net/dev | grep $interface | cut -d ':' -f 2 | awk '\{print "received_bytes="$1, "transmitted_bytes="$9\}')\cb1 \
\cb2 eval $line\cb1 \
\cb2 \}\cb1 \
\cb2 # Function which calculates the speed using actual and old byte number.\cb1 \
\cb2 # Speed is shown in KByte per second when greater or equal than 1 KByte per second.\cb1 \
\cb2 # This function should be called each second.\cb1 \
\cb2 get_velocity()\cb1 \
\cb2 \{\cb1 \
\cb2 value=$1\cb1 \
\cb2 old_value=$2\cb1 \
\cb2 let vel=$value-$old_value\cb1 \
\cb2 let velKB=$vel/1024\cb1 \
\cb2 if [ $velKB != 0 ];\cb1 \
\cb2 then\cb1 \
\cb2 echo -n "$velKB KB/s";\cb1 \
\cb2 else\cb1 \
\cb2 echo -n "$vel B/s";\cb1 \
\cb2 fi\cb1 \
\cb2 \}\cb1 \
\cb2 # Gets initial values.\cb1 \
\cb2 get_bytes\cb1 \
\cb2 old_received_bytes=$received_bytes\cb1 \
\cb2 old_transmitted_bytes=$transmitted_bytes\cb1 \
\cb2 # Shows a message and waits for one second.\cb1 \
\cb2 echo "Starting...";\cb1 \
\cb2 sleep 1;\cb1 \
\cb2 echo "";\cb1 \
\cb2 # Main loop. It will repeat forever.\cb1 \
\cb2 while true;\cb1 \
\cb2 do\cb1 \
\cb2 # Get new transmitted and received byte number values.\cb1 \
\cb2 get_bytes\cb1 \
\cb2 # Calculates speeds.\cb1 \
\cb2 vel_recv=$(get_velocity $received_bytes $old_received_bytes)\cb1 \
\cb2 vel_trans=$(get_velocity $transmitted_bytes $old_transmitted_bytes)\cb1 \
\cb2 # Shows results in the console.\cb1 \
\cb2 echo -en "$interface DOWN:$vel_recv\\tUP:$vel_trans\\r"\cb1 \
\cb2 # Update old values to perform new calculations.\cb1 \
\cb2 old_received_bytes=$received_bytes\cb1 \
\cb2 old_transmitted_bytes=$transmitted_bytes\cb1 \
\cb2 # Waits one second.\cb1 \
\cb2 sleep 1;\cb1 \
\cb2 done}
