sudo dnf install firewalld -y
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo firewall-cmd --state

firewall-cmd --get-default-zone
firewall-cmd --get-active-zones

sudo firewall-cmd --list-all

sudo firewall-cmd --zone=home --list-all
sudo firewall-cmd --zone=home --change-interface=eth0

firewall-cmd --get-active-zones

firewall-cmd --get-services
sudo firewall-cmd --zone=public --add-service=http
sudo firewall-cmd --zone=public --list-services

sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --runtime-to-permanent

sudo firewall-cmd --zone=public --list-services --permanent

sudo firewall-cmd --zone=public --add-service=https
sudo firewall-cmd --zone=public --add-service=https --permanent 

sudo firewall-cmd --zone=public --add-port=5000/tcp
udo firewall-cmd --zone=public --list-ports

sudo firewall-cmd --zone=public --add-port=4990-4999/udp
sudo firewall-cmd --zone=public --permanent --add-port=5000/tcp
sudo firewall-cmd --zone=public --permanent --add-port=4990-4999/udp
sudo firewall-cmd --zone=public --permanent --list-ports

sudo firewall-cmd --permanent --new-zone=publicweb
sudo firewall-cmd --permanent --new-zone=privateDNS
sudo firewall-cmd --permanent --get-zones
sudo firewall-cmd --reload

sudo firewall-cmd --zone=publicweb --add-service=ssh
sudo firewall-cmd --zone=publicweb --add-service=http
sudo firewall-cmd --zone=publicweb --add-service=https
sudo firewall-cmd --zone=publicweb --list-all

Output
publicweb
  target: default
  icmp-block-inversion: no
  interfaces:
  sources:
  services: http https ssh
  ports:
  protocols:
  forward: no
  masquerade: no
  forward-ports:
  source-ports:
  icmp-blocks:
  rich rules:
  
  sudo firewall-cmd --zone=privateDNS --add-service=dns
sudo firewall-cmd --zone=privateDNS --list-all

sudo firewall-cmd --zone=publicweb --change-interface=eth0
sudo firewall-cmd --zone=privateDNS --change-interface=eth1

sudo firewall-cmd --runtime-to-permanent
sudo firewall-cmd --reload

firewall-cmd --get-active-zones
Output
privateDNS
  interfaces: eth1
publicweb
  interfaces: eth0




