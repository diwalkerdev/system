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
read -p "pacman: install useful packages?" yn
case $yn in
	[y] )
		# install nonfree graphics drivers.
		sudo mhwd -a pci nonfree 0300
		
		sudo pacman -S \
		clang \
		ninja \
		gdb \
		make \
		cmake \
		neovim \
		python-pip \
		python-poetry \
		syncthing \
		helix
		;;
	* )
		;;
esac


# start syncthing on startup
read -p "syncthing: enable service?" yn
case $yn in
	[y] )
		systemctl --user enable syncthing.service
		systemctl --user start syncthing.service
		;;
	* )
		;;
esac


# git config
read -p "git: configure username/email/pull strategy?" yn
case $yn in
	[y] )
		git config --global user.name "David Walker"
		git config --global user.email "dwalker0044@gmail.com"
		git config --global init.defaultBranch main
		git config --global pull.rebase true
		;;
	* )
		;;
esac


# install the official binary version of vscode (has more features than the app store version)
read -p "VSCode: install official binary from AUR?" yn
case $yn in
	[y] )
		git clone https://aur.archlinux.org/visual-studio-code-bin.git
		pushd visual-studio-code-bin
			mkpkg -si
		popd
		;;
	* )
		;;
esac


# copy defaults to vscode
read -p "VSCode: install settings.json? [y/*]" yn
case $yn in
	[y] )
		mkdir -p "${HOME}/.config/Code - OSS/User"
		ln -s "${HOME}/system/config/vscode/settings.json" "${HOME}/.config/Code - OSS/User/settings.json"
		;;
	* )
		;;
esac


# install nvim default
read -p "NeoVim: install init.vim? [y/*]" yn
case $yn in
	[y] )
		mkdir -p "${HOME}/.config/nvim"
	  ln -s "${HOME}/system/config/nvim/init.vim" "${HOME}/.config/nvim/init.vim"
		;;
	* )
		;;
esac


# install helix
read -p "Helix: install config.toml? [y/*]" yn
case $yn in
	[y] )
		mkdir -p "${HOME}/.config/helix"
	  ln -s "${HOME}/system/config/helix/config.toml" "${HOME}/.config/helix/config.toml"
		;;
	* )
		;;
esac


# build zig from source
read -p "Zig: build from source? [y/*]" yn
case $yn in
	[y] )
		git clone git@github.com:ziglang/zig.git
		pushd zig
			mkdir build
			pushd build
				cmake -DCMAKE_BUILD_TYPE=Release ..
				make install
		  popd
		popd
		;;
	* )
		;;
esac

