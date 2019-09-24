#!/bin/bash

echo -n "please enter the ip and root password of host which you want to monitor->"
read client_ip password
[ -f /usr/bin/expect ] || yum -y install expect
client_config () {
/usr/bin/expect << EOF
set timeout 200
spawn scp  -o StrictHostKeyChecking=no $(pwd)/yum.sh snmp.sh ${client_ip}:/root
expect "password"
send "${passwd}\r"
set timeout 200
expect eof
exit
EOF

/usr/bin/expect << EOF
set timeout 200
spawn ssh ${client_ip} -o StrictHostKeyChecking=no /root/yum.sh
expect "password"
send "${passwd}\r"
set timeout 200
expect eof
exit
EOF

/usr/bin/expect << EOF
set timeout 200
spawn ssh ${client_ip} -o StrictHostKeyChecking=no /root/snmp.sh
expect "password"
send "${passwd}\r"
set timeout 200
expect eof
exit
EOF
}

client_config
