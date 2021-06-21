@echo "For Graphics Drivers install from the Manjaro Settings Manager."

sudo pacman-mirrors --fasttrack && sudo pacman -Syyu

sudo pacman -S gdb
sudo pacman -S make
sudo pacman -S clang
sudo pacman -S ninja

sudo pacman -S fzf
sudo pacman -S python-neovim
sudo pacman -S neovim
