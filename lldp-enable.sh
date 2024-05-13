#!/usr/bin/expect
#
# Author: Luan Andrade
# Linkedin: https://www.linkedin.com/in/luan-william-vieira-de-andrade-5a8110197/
#


set usuario [lindex $argv 0];
set senha [lindex $argv 1];
set host [lindex $argv 2];
set timeout 10;

spawn ssh -o StrictHostKeyChecking=no $usuario@$host
expect -exact "password: "
send -- "$senha\r"
expect -exact "\*>"
send -- "sys\r"
expect -exact "\*]"
send -- "lldp enable\r q\r"

expect -exact "\*>"
send -- "quit\r"
send -- "y\r"
      
