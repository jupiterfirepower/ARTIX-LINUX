firewall-cmd --set-default-zone drop
firewall-cmd --zone=drop --change-interface=eno2
firewall-cmd --zone=drop --change-interface=eno2 --permanent
firewall-cmd --get-active-zones
firewall-cmd --runtime-to-permanent


