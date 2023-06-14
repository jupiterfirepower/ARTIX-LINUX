# Firewall
sudo pacman -Syy --noconfirm nftables-openrc

yes | sudo \cp -ivf ./config/nftables.conf /etc/nftables.conf
sudo chown -R root:root /etc/nftables.conf

sudo nft -f /etc/nftables.conf

sudo rc-service nftables save
sudo rc-service nftables start
sudo rc-update add nftables default

# sysctl kernel params
yes | sudo \cp -ivf ./config/sysctl.conf /etc/sysctl.conf
sudo sysctl -p
