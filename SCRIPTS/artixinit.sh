# sudo sed -i 's/#\[lib32\]/\[lib32\]/' /etc/pacman.conf

echo "[lib32]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

sudo pacman -Syy
sudo pacman -Syu --noconfirm git base-devel mc wget curl zip unzip

echo -en "\n" >> /etc/pacman.conf
echo "[universe]" >> /etc/pacman.conf
echo "Server = https://universe.artixlinux.org/\$arch" >> /etc/pacman.conf
echo "Server = https://mirror1.artixlinux.org/universe/\$arch" >> /etc/pacman.conf
echo "Server = https://mirror.pascalpuffke.de/artix-universe/\$arch" >> /etc/pacman.conf
echo "Server = https://artixlinux.qontinuum.space/artixlinux/universe/os/\$arch" >> /etc/pacman.conf
echo "Server = https://mirror1.cl.netactuate.com/artix/universe/\$arch" >> /etc/pacman.conf
echo "Server = https://ftp.crifo.org/artix-universe/\$arch" >> /etc/pacman.conf
echo "Server = https://artix.sakamoto.pl/universe/\$arch" >> /etc/pacman.conf

sudo pacman -Syy

sudo pacman -S --noconfirm artix-archlinux-support
sudo pacman-key --populate archlinux

echo -en "\n" >> /etc/pacman.conf
echo "# Arch" >> /etc/pacman.conf
echo "[extra]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf

echo "[community]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf

echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf

sudo pacman -Syu --noconfirm firefox vivaldi brave-bin ffmpeg4.4 xfce4-xkb-plugin xfce4-whiskermenu-plugin bluez bluez-utils blueman qimgv qpdfview gparted
#sudo pacman -S --noconfirm atom
	
# flatpak install flathub io.atom.Atom
# flatpak run io.atom.Atom
yay -S visual-studio-code-bin

	
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin
makepkg -si

echo -en "\n" >> /etc/pacman.conf
echo "[omniverse]" >> /etc/pacman.conf
echo "Server = https://eu-mirror.artixlinux.org/omniverse/$arch" >> /etc/pacman.conf
echo "Server = https://omniverse.artixlinux.org/$arch" >> /etc/pacman.conf
echo "Server = https://artix.sakamoto.pl/omniverse/$arch" >> /etc/pacman.conf

echo -en "\n" >> /etc/pacman.conf
echo "[linux-xanmod]" >> /etc/pacman.conf
echo "SigLevel = Optional TrustAll" >> /etc/pacman.conf
echo "Server = https://repo.blacksky3.com/$arch/$repo" >> /etc/pacman.conf

# Yay
mkdir repo
cd repo
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
yay -Syy

# Add AUR repository
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo "[chaotic-aur]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

# Firewall
sudo pacman -S --noconfirm nftables-openrc
sudo cp ./config/nftables.conf /etc/nftables.conf 
sudo nft -f /etc/nftables.conf
sudo rc-service nftables save
sudo rc-service nftables start
sudo rc-update add nftables default
sudo pacman -S --noconfirm linux-xanmod-edge linux-xanmod-edge-headers
sudo pacman -S --noconfirm linux-hardened linux-hardened-headers

# sysctl kernel params
sudo cp ./config/sysctl.conf /etc/sysctl.conf 
sudo sysctl -p
sudo reboot

# Printer Canon Pixma TS3340
sudo pacman -S --noconfirm cups cups-pdf avahi nss-mdns canon-pixma-g6000-complete 

sudo pacman -Syy
sudo pacman -S --noconfirm linux-xanmod-edge linux-xanmod-edge-headers

#sudo pacman-key --populate artix
#sudo pacman-key --init
#sudo pacman -Syu
#sudo pacman -S artix-archlinux-support
#sudo pacman-key --populate archlinux



yay -S atom-community-git
lsblk
#sudo dd if=garuda-wayfire-linux-zen-230311.iso of=/dev/sdc bs=1M status=progress conv=noerror,sync
#wget -qO - https://api.ipify.org; echo
#torsocks wget -qO - https://api.ipify.org; echo


sudo pacman -S --noconfirm jdk-openjdk

