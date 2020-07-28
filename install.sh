#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

function MakeItSo() {
	# Ask for Administrator password upfront
	sudo -v

	# check for software updates and apply them
	sudo softwareupdate -i -a

	# install homebrew
	echo "> Adding Homebrew 🍺"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	brew update

	# install homebrew version of bash
	echo "> Install 🍺  version of bash"
	brew install bash
	echo /usr/local/bin/bash | sudo tee -a /etc/shells
	chsh -s /usr/local/bin/bash

	# bash config files
	echo "> Remove outdated bash config files"
	rm -rf ~/.aliases ~/.bash_profile ~/.bashrc ~/.exports ~/.functions ~/.inputrc ~/.path
	echo "> Add latest bash config files with symlinks"
	ln -s ~/Projects/dotfiles-mnml/shell/bash_aliases ~/.aliases
	ln -s ~/Projects/dotfiles-mnml/shell/bash_exports ~/.exports
	ln -s ~/Projects/dotfiles-mnml/shell/bash_functions ~/.functions
	ln -s ~/Projects/dotfiles-mnml/shell/bash_paths ~/.path
	ln -s ~/Projects/dotfiles-mnml/shell/bash_profile ~/.bash_profile
	ln -s ~/Projects/dotfiles-mnml/shell/bashrc ~/.bashrc
	ln -s ~/Projects/dotfiles-mnml/shell/inputrc ~/.inputrc
	# If you want to see system notifications / copyright etc
	# Remove or comment out the line below
	touch ~/.hushlogin

	# git config files
	echo "> Remove outdated git config files"
	rm -rf ~/.gitconfig ~/.gitignore_global ~/.extra
	echo "> Add latest git config files"
	ln -s ~/Projects/dotfiles-mnml/git/extra ~/.extra
	ln -s ~/Projects/dotfiles-mnml/git/gitconfig ~/.gitconfig
	ln -s ~/Projects/dotfiles-mnml/git/gitignore_global ~/.gitignore_global

	# Reload bash_profile
	echo "> Loading bash_profile"
	source ~/.bash_profile

	echo "> All tasks have been completed"
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	MakeItSo
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (Y/N) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		MakeItSo
	fi
fi

unset MakeItSo
