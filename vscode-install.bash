pushd ${HOME}
	git clone https://aur.archlinux.org/visual-studio-code-bin.git

	pushd visual-studio-code-bin
		makepkg -Acs
		sudo pacman -U visual-studio-code-bin-1.74.2-1-x86_64.pkg.tar.zst
	popd

popd

