# Dnscrypt proxy ODoH https quick

sudo pacman -S --noconfirm dnscrypt-proxy

yes | sudo \cp -ivf ./dnscrypt-proxy/dnscrypt-proxy.toml /etc/dnscrypt-proxy/dnscrypt-proxy.toml
sudo chown -R root:root /etc/dnscrypt-proxy/dnscrypt-proxy.toml

yes | sudo \cp -ivf ./dnscrypt-proxy/dnsmasq.conf /etc/dnsmasq.conf
sudo chown -R root:root /etc/dnsmasq.conf

yes | sudo \cp -ivf ./dnscrypt-proxy/resolv.conf /etc/resolv.conf
sudo chown -R root:root /etc/resolv.conf
sudo chattr +i /etc/resolv.conf

yes | sudo \cp -ivf ./dnscrypt-proxy/update-adblocker.sh /etc/dnscrypt-proxy/update-adblocker.sh
sudo chown -R root:root /etc/dnscrypt-proxy/update-adblocker.sh

sudo chmod +x /etc/dnscrypt-proxy/update-adblocker.sh

sudo /etc/dnscrypt-proxy/update-adblocker.sh
yes | sudo \cp -ivf /etc/dnscrypt-proxy/blacklist.txt /etc/dnscrypt-proxy/blocked-names.txt

sudo pacman -Syy --noconfirm dnscrypt-proxy-openrc
sudo rc-update add dnscrypt-proxy
sudo reboot
