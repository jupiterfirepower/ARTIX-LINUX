# sudo sed -i 's/#\[lib32\]/\[lib32\]/' /etc/pacman.conf

echo -en "\n" >> /etc/pacman.conf
echo "[lib32]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

sudo pacman -Syy --noconfirm git base-devel mc wget curl zip unzip

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

echo -en "\n" >> /etc/pacman.conf
echo "[community]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf

echo -en "\n" >> /etc/pacman.conf
echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf

sudo pacman -Syu --noconfirm qpdfview gparted
# qimgv

echo -en "\n" >> /etc/pacman.conf
echo "[omniverse]" >> /etc/pacman.conf
echo "Server = https://eu-mirror.artixlinux.org/omniverse/\$arch" >> /etc/pacman.conf
echo "Server = https://omniverse.artixlinux.org/\$arch" >> /etc/pacman.conf
echo "Server = https://artix.sakamoto.pl/omniverse/\$arch" >> /etc/pacman.conf

#echo -en "\n" >> /etc/pacman.conf
#echo "[linux-xanmod]" >> /etc/pacman.conf
#echo "SigLevel = Optional TrustAll" >> /etc/pacman.conf
#echo "Server = https://repo.blacksky3.com/\$arch/\$repo" >> /etc/pacman.conf

sudo pacman -Syy
