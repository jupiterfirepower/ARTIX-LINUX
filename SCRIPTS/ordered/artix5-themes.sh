echo "Install plank ..."
sudo pacman -S --noconfirm plank
# sudo pacman -S --noconfirm adapta-gtk-theme-plank elementary-theme-plank arc-theme-plank

mkdir -p ~/.local/share/plank/themes
tar -xvf ~/Downloads/SCRIPTS/config/themes/TCE\ inBlack\ Trend\ -\ Uppercap.tar.xz -C ~/.local/share/plank/themes
sudo chown -R jupiter:jupiter ~/.local/share/plank/themes/TCE\ inBlack\ Trend\ -\ Uppercap

yes | sudo \cp -ivr ~/Downloads/SCRIPTS/config/profile/plank  ~/.config

# plank --preferences

echo "Install xfce themes ..."
sudo pacman -S --noconfirm dracula-gtk-theme sweet-gtk-theme sweet-gtk-theme-dark sweet-folders-icons-git # sweet-cursors-theme-git
yay -S sweet-cursors-theme-git

echo "Install xfce icons ..."
sudo pacman -S --noconfirm candy-icons-git

echo "Set xfce Sweet theme for xfce ..."
xfconf-query -c xsettings -p /Net/ThemeName -s "Sweet"
# xfconf-query -c xsettings -p /Net/ThemeName -s "Dracula"
# xfconf-query -c xsettings -p /Net/ThemeName -s "Greybird"

echo "Install Roboto Fonts ..."
sudo pacman -S --noconfirm ttf-roboto

##########################################
# xfce4 General Settings
##########################################
# set xfce4 theme
xfconf-query --channel xsettings --property /Net/ThemeName --set "Sweet"
# set xfce4 icon theme
xfconf-query --channel xsettings --property /Net/IconThemeName --set "Sweet-Reinbow"
#
xfconf-query --channel xsettings --property /Gtk/CursorThemeName --set "Sweet-cursors"
# set default font
# xfconf-query --channel xsettings --property /Gtk/FontName --set "Roboto Mono Regular 11"
# set default monospace font
# xfconf-query --channel xsettings --property /Gtk/MonospaceFontName --set "Roboto Mono Regular 11"

xfconf-query --channel xfce4-panel --property /panels/panel-1/position --set "p=6;x=0;y=0"

##########################################
# xfwm4 Window Manager Settings
##########################################
# set xfwm4 window manager theme
xfconf-query --channel xfwm4 --property /general/theme --set "Dracula"
# set xfwm4 window manager title font
xfconf-query --channel xfwm4 --property /general/title_font --set "Roboto Mono Regular 11"

# set icon size to automatically
xfconf-query --channel xfce4-panel --property /panels/panel-1/icon-size --set "16"
xfconf-query --channel xfce4-panel --property /panels/panel-1/size --set "46"

##########################################
# Thunar Configuration
##########################################
# show hidden files
xfconf-query --channel thunar --property /last-show-hidden --set true
# set default view to 'details'
xfconf-query --channel thunar --property /default-view --set "ThunarDetailsView"
# sort by type
xfconf-query --channel thunar --property /last-sort-column --set "THUNAR_COLUMN_TYPE"
# sort in ascending order
xfconf-query --channel thunar --property /last-sort-order --set "GTK_SORT_ASCENDING"
# sort folder first
xfconf-query --channel thunar --property /misc-folders-first --set true
# column to show and order
xfconf-query --channel thunar --property /last-details-view-column-order --set "THUNAR_COLUMN_NAME,THUNAR_COLUMN_SIZE,THUNAR_COLUMN_TYPE,THUNAR_COLUMN_DATE_MODIFIED"
# visible colummns in details view
xfconf-query --channel thunar --property /last-details-view-visible-columns --set "THUNAR_COLUMN_DATE_MODIFIED,THUNAR_COLUMN_NAME,THUNAR_COLUMN_OWNER,THUNAR_COLUMN_PERMISSIONS,THUNAR_COLUMN_SIZE,THUNAR_COLUMN_TYPE"
# set date stle YYYY-MM-DD
xfconf-query --channel thunar --property /misc-date-style --set "THUNAR_DATE_STYLE_YYYYMMDD"

#
xfconf-query --channel thunar --create --property /misc-thumbnail-mode --type string --set "THUNAR_THUMBNAIL_MODE_ONLY_LOCAL"
xfconf-query --channel thunar --create --property /misc-thumbnail-draw-frames --type bool --set false
xfconf-query --channel thunar --create --property /last-menubar-visible --type bool --set true
xfconf-query --channel thunar --create --property /misc-file-size-binary --type bool --set true

#echo $(xfconf-query -c xfce4-panel -lv | grep whiskermenu | awk '{print $1}')
#xfconf-query -c xfce4-panel -p $(xfconf-query -c xfce4-panel -lv | grep whiskermenu | awk '{print $1}') -l -v



echo "Install xfce4-xkb-plugin ..."
sudo pacman -S --noconfirm xfce4-xkb-plugin

sudo pacman -S lightdm-webkit2-greeter

sudo mkdir -p ~/Downloads/tmp/glorious
sudo tar -xvzf ~/Downloads/SCRIPTS/config/themes/glorious.tar.gz -C ~/Downloads/tmp/glorious
# sudo cp ~/Downloads/tmp/lightdm-webkit2-theme-glorious-2.0.5 /usr/share/lightdm-webkit/themes/glorious
yes | sudo \cp -ivr ~/Downloads/tmp/glorious /usr/share/lightdm-webkit/themes
sudo chmod -R 755 /usr/share/lightdm-webkit/themes/glorious

sudo sed -i 's/= antergos/= glorious/' /etc/lightdm/lightdm-webkit2-greeter.conf
sudo sed -i 's/greeter-session=lightdm-gtk-greeter/greeter-session=lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf

# echo "Set WALLPAPPER ..."
yes | \cp -ivr ~/Downloads/SCRIPTS/config/WALLPAPPER ~/Pictures
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP1/workspace0/last-image -s ~/Pictures/WALLPAPPER/2w.jpg

xfconf-query -c xfwm4 -p /general/workspace_count -s 4
#xfconf-query -c xfce4-panel -p /plugins/plugin-4/rows -s 4


# xfconf-query -c xfce4-panel -p $(xfconf-query -c xfce4-panel -lv | grep clock | awk '{print $1}')/digital-format -t "string" -s '<span font="18">%T</span>%n<span font="12">%Y-%m-%d</span>' -n
xfconf-query -c xfce4-panel -p $(xfconf-query -c xfce4-panel -lv | grep clock | awk '{print $1}')/digital-layout -s 3

#xfce4-panel --restart

# Configuration Tweaks

# Hide Suspend, Hibernate, and Hybrid Sleep from the logout dialog:

xfconf-query -c xfce4-session -np '/shutdown/ShowSuspend' -t 'bool' -s 'false'
xfconf-query -c xfce4-session -np '/shutdown/ShowHibernate' -t 'bool' -s 'false'
xfconf-query -c xfce4-session -np '/shutdown/ShowHybridSleep' -t 'bool' -s 'false'

# ARTIX GRUB THEME
sudo mkdir -p ~/Downloads/tmp/artix
sudo tar -xvf ~/Downloads/SCRIPTS/config/themes/artix.tar -C ~/Downloads/tmp/artix
yes | sudo \cp -ivr ~/Downloads/tmp/artix /usr/share/grub/themes

# fix "horizontal line bug" in xfce
# https://arcolinux.com/how-to-remove-the-shadow-around-the-plank-on-xfce/
xfconf-query --channel xfwm4 --property /general/show_dock_shadow --set "false"

##########################################
# Keyboard Shortcuts
##########################################
# Open xfce4-Terminal: super + t
xfconf-query --channel xfce4-keyboard-shortcuts --create --property "/commands/custom/<Super>t" --type string --set "xfce4-terminal"
# Lock: super + l
xfconf-query --channel xfce4-keyboard-shortcuts --create --property "/commands/custom/<Super>l" --type string --set "xflock4"
# tile window lower left quarter: alt + super + left
xfconf-query --channel xfce4-keyboard-shortcuts --create --property "/xfwm4/custom/<Alt><Super>Left" --type string --set "tile_down_left_key"
# tile window lower right quarter: alt + super + right
xfconf-query --channel xfce4-keyboard-shortcuts --create --property "/xfwm4/custom/<Alt><Super>Right" --type string --set "tile_down_right_key"
# tile window lower half: super + down
xfconf-query --channel xfce4-keyboard-shortcuts --create --property "/xfwm4/custom/<Super>Down" --type string --set "tile_down_key"
# tile window left half: super + left
xfconf-query --channel xfce4-keyboard-shortcuts --create --property "/xfwm4/custom/<Super>Left" --type string --set "tile_left_key"
# tile window right half: super + right
xfconf-query --channel xfce4-keyboard-shortcuts --create --property "/xfwm4/custom/<Super>Right" --type string --set "tile_right_key"
# tile window upper half: super + up
xfconf-query --channel xfce4-keyboard-shortcuts --create --property "/xfwm4/custom/<Super>Up" --type string --set "tile_up_key"
# tile window upper left quarter: ctrl + super + left
xfconf-query --channel xfce4-keyboard-shortcuts --create --property "/xfwm4/custom/<Primary><Super>Left" --type string --set "tile_up_left_key"
# tile window upper right quarter: ctrl + super + right
xfconf-query --channel xfce4-keyboard-shortcuts --create --property "/xfwm4/custom/<Primary><Super>Right" --type string --set "tile_up_right_key"
# take screenshot with flameshot: print
xfconf-query --channel xfce4-keyboard-shortcuts --create --property "/commands/custom/Print" --type string --set "flameshot gui"
# show desktop: super + d
xfconf-query --channel xfce4-keyboard-shortcuts --create --property "/xfwm4/custom/<Super>d" --type string --set "show_desktop_key"

# copy xfce config
yes | sudo \cp -ivr ~/Downloads/SCRIPTS/config/profile/xfce4  ~/.config

echo "Finished. Done!"

# https://devpress.csdn.net/linux/62f63ad8c6770329307fc3fa.html
# http://xubuntugeek.blogspot.com/2012/05/xfconf-query-set-array-value-to.html
# https://unix.stackexchange.com/questions/696121/xfconf-query-create-property-for-a-plugin-property-x-does-not-exist-on-channel
# https://docs.xfce.org/xfce/xfce4-panel/clock
# xfconf-query -c xfce4-panel -lv $(xfconf-query -c xfce4-panel -lv | grep clock | awk '{print $1}')

# https://wiki.archlinux.org/title/xfce

# https://github.com/x4242/linuxcustomization/blob/master/25-config-xfce.sh
# https://felipec.wordpress.com/2022/02/09/xfce-config-helper-0-1/

# https://github.com/x4242/linuxcustomization/blob/master/25-config-xfce.sh
# http://xubuntugeek.blogspot.com/2013/03/how-to-add-application-launcher-to.html
# http://xubuntugeek.blogspot.com/2011/12/add-items-to-xfce-applications-menu.html
# https://felipec.wordpress.com/2022/02/09/xfce-config-helper-0-1/

# http://xubuntugeek.blogspot.com/2012/06/how-to-graphically-edit-xfcexubuntu.html

# https://forum.manjaro.org/t/popping-up-whisker-menu-with-super-key/117865
# https://wiki.xfce.org/howto/customize-menu
# https://livingthelinuxlifestyle.wordpress.com/2019/05/13/how-to-install-whisker-menu-on-an-xfce-desktop/

# https://gist.github.com/rkeytech/a161be581706ccb35c6ba5a1f9b04643




