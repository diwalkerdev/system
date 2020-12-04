@echo "Grpahics Drivers - install from Manjaro Settings Manager."

sudo pacman-mirrors --fasttrack && sudo pacman -Syyu

sudo pacman -S gdb
sudo pacman -S boost
sudo pacman -S make
sudo pacman -S clang

sudo pacman -S fzf
sudo pacman -S python-neovim
sudo pacman -S neovim

sudo pacman -S nasm
sudo pacman -S yasm
sudo pacman -S ffmpeg

