# Printer Canon Pixma TS3340
sudo pacman -Syy --noconfirm cups cups-pdf avahi nss-mdns 

yes | sudo \cp -ivf ./config/nsswitch.conf /etc/nsswitch.conf

git clone https://aur.archlinux.org/canon-pixma-g6000-complete.git
cd canon-pixma-g6000-complete
makepkg -si
