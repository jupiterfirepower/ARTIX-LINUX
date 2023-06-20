# Firewall
sudo pacman -Syy --noconfirm nftables

yes | sudo \cp -ivf ./config/nftables.conf /etc/nftables.conf
sudo chown -R root:root /etc/nftables.conf

sudo nft -f /etc/nftables.conf

sudo systemctl start nftables.service
sudo systemctl enable nftables.service

# sysctl kernel params
# yes | sudo \cp -ivf ./config/sysctl.conf /etc/sysctl.conf
# sudo sysctl -p
