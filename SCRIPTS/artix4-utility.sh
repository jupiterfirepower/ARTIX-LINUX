# Yay
mkdir repo
cd repo
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
yay -Syy pamac-aur
yay -S archlinux-appstream-data-pamac

sudo pacman -Syy --noconfirm dnsutils net-tools xarchiver unzip unrar

sudo pacman -Rs $(pacman -Qtdq)
sudo pacman -S xarchiver
sudo pacman -S grub-customizer

#sudo pacman-key --refresh-keys
#sudo archlinux-keyring-wkd-sync
#sudo bash -x /usr/bin//archlinux-keyring-wkd-sync
