# sudo pacman -S --noconfirm flatpak
# flatpak install flathub io.atom.Atom com.visualstudio.code

sudo pacman -S --noconfirm jdk-openjdk
mkdir tmp
cd tmp
sudo wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
sudo cp ./tmp/lein /usr/local/bin/lein
sudo chmod a+x /usr/local/bin/lein

# Scala
curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup

yay -S --noconfirm atom-bin 

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh


# ghci
# cabal init --interactive
# ghcup tui

sudo pacman -S --noconfirm neovim
