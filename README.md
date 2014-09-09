alienvault-ossim
================

Scripts for OSSIM

<p>This script is for the execute an external program inside of threat intelligence/policy. You can use it for a policy of your choosing where an alert is triggered in alienvault. As an example, My personal setup is when the seim event of ASA: A real IP packet was denied by the ACL comes in. I have a policy which runs an external program. This bash script being that external program. It sends the SRC_IP to a text file then pipes it to the expect script for a shun on the ASA firewall. For my networks 100% of the alerts coming in with this event are bad reputation IP addresses. I set it up this way until the reputation filters start working for me in ossim. 

<p>SETUP</p>
Move runasashun.sh and asashun.sh to /usr/local/bin and edit the expect sections of username,password, and ip of your asa firewall in asashun.sh. Also make both .sh scripts executable with chmod +x. </p>

<p>Add this line below to the command: * field inside of threat intelligence/actions</p>
/bin/echo 'SRC_IP' >> /root/ip.txt & /bin/bash /usr/local/bin/runasashun.sh
