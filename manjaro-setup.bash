read -p "Pacman: Fastrack mirrors? [y/*]" yn
case $yn in
	[y] )
		sudo pacman-mirrors --fasttrack
		;;
	* )
		;;
esac

sudo pacman -Syyu

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

# copy defaults to vscode
read -p "VSCode: install settings.json? [y/*]" yn
case $yn in
	[y] )
		cp settings.json "${HOME}/.config/Code - OSS/User/settings.json"
		;;
	* )
		;;
esac

# install nvim default?
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