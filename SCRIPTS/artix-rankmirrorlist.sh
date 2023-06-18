sudo pacman -Syy --noconfirm pacman-contrib
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
rankmirrors -v -n 10 /etc/pacman.d/mirrorlist
sudo pacman -Syy

## sh -c “$(curl — fsSL https://bit.ly/install-reflector)”
## sudo reflector — verbose -n 12 -l 12 -f 12 — sort rate — save /etc/pacman.d/mirrorlist
## sudo pacman -Syu