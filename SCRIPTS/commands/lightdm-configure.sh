sudo systemctl disable ly.service -f

sudo pacman -Syyu lightdm
sudo pacman -S lightdm-webkit2-greeter

sudo nano /etc/lightdm/lightdm.conf

#lightdm-slick-greeter
#lightdm-webkit2-greeter
#lightdm-unity-greeter
#lightdm-pantheon-greeter
#lightdm-mini-greeter
#lightdm-gtk-greeter

lightdm --test-mode --debug

sudo systemctl enable lightdm -f

#grep 'ExecStart=' /etc/systemd/system/display-manager.service
#systemctl status display-manager
#systemctl --property=Id,Description show display-manager.service
