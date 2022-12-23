sudo pacman-mirrors --fasttrack && sudo pacman -Syyu

# install nonfree graphics drivers.
sudo mhwd -a pci nonfree 0300

sudo pacman -S \
clang \
ninja \
gdb \
make \
neovim \
python-pip \
python-poetry \
syncthing

systemctl --user enable syncthing.service
systemctl --user start syncthing.service

# generate ssh-key
ssh-keygen -t ed25519
