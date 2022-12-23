sudo pacman-mirrors --fasttrack && sudo pacman -Syyu

# Install nonfree graphics drivers.
sudo mhwd -a pci nonfree 0300

sudo pacman -S clang
sudo pacman -S ninja
sudo pacman -S gdb
sudo pacman -S make
sudo pacman -S neovim
sudo pacman -S python-pip
sudo pacman -S python-poetry
sudo pacman -S syncthing

# Toolchain for arm cortex-m3 development:
# sudo pacman -S qemu arm-none-eabi-gcc arm-none-eabi-gdb

systemctl --user enable syncthing.service
systemctl --user start syncthing.service
