alienvault-ossim
================

Scripts for OSSIM

<p>This script is for the execute an external program inside of threat intelligence/policy. 
move runasashun.sh and asashun.sh to /usr/local/bin and edit the expect sections of username,password, and ip of your asa firewall in asashun.sh </p>

<p>Add this line below to the command: * field</p>
/bin/echo 'SRC_IP' >> /root/ip.txt & /bin/bash /usr/local/bin/runasashun.sh
