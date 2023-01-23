read -p "Pacman: Fastrack mirrors? [y/*]" yn
case $yn in
	[y] )
		sudo pacman-mirrors --fasttrack
		;;
	* )
		;;
esac

read -p "Pacman: Update? [y/*]" yn
case $yn in
	[y] )
		sudo pacman -Syyu
		;;
	* )
		;;
esac

# install vscode from AUR
read -p "VSCode: install from AUR? [y/*]" yn
case $yn in
	[y] )
		"${HOME}/system/vscode-install.bash"
		;;
	* )
		;;
esac

# copy defaults to vscode
# TODO(DW): would be better to install an symlink back to this file.
read -p "VSCode: install settings.json? [y/*]" yn
case $yn in
	[y] )
		cp "${HOME}/system/vscode-settings.json" "${HOME}/.config/Code/User/settings.json"
		;;
	* )
		;;
esac

# install nvim default?
# TODO(DW): would be better to install an symlink back to this file.
read -p "NeoVim: install init.vim? [y/*]" yn
case $yn in
	[y] )
		mkdir -p "${HOME}/.config/nvim" && cp "${HOME}/system/config/nvim/init.vim" "${HOME}/.config/nvim/init.vim"
		;;
	* )
		;;
esac

# append source line to .bashrc
read -p "BashRC: append davidw.bashrc to .bashrc? [y/*]" yn
case $yn in
	[y] )
		echo "source ${HOME}/system/davidw.bashrc" >> "${HOME}/.bashrc"
		;;
	* )
		;;
esac

# install useful packages
read -p "Install useful packages and configurations? [y/*]" yn
case $yn in
	[y] )
		;;
	* )
		exit
		;;
esac

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

# start syncthing on startup
systemctl --user enable syncthing.service
systemctl --user start syncthing.service

# git config
git config --global user.name "David Walker"
git config --global user.email "dwalker0044@gmail.com"
git config --global init.defaultBranch main
git config --global pull.rebase true
