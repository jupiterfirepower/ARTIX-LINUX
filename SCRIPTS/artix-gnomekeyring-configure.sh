sudo pacman -S --noconfirm gnome-keyring
sudo echo "auth	optional	pam_gnome_keyring.so" >> /etc/pam.d/login
sudo echo "session	optional	pam_gnome_keyring.so auto_start" >> /etc/pam.d/login