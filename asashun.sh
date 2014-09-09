#!/bin/bash

read ip; export ip

        /usr/bin/expect -c '
        set username yourusername
        set password yourpassword
        spawn ssh $username@ip-of-your-asa-firewall
        expect -re ".*(yes/no)" {
                send "yes\r"
                exp_continue
        }
        expect -re ".*password:"
        send -- "$password\r"
        expect -re ".*>"
        send "enable\r"
        expect -re ".*Password:"
        send -- "$password\r"
        expect -re ".*#"
        send "config t\r"
        expect -re ".* (config)#"
        send "shun $env(ip)\r"
        expect ".* (config)#"
        send "exit\r"
        expect -re ".*#"
        send "write mem\r"
        expect ".*#"
        send "exit\r"
        send "exit\r"
        '
rm /root/ip.txt
