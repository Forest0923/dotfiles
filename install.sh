#!/bin/sh
set -e

source lib/inquirer.sh

link_user() {
	software=('bash' 'zsh' 'vim' 'neovim' 'tmux' 'alacritty' 'wezterm')
	checkbox_input "Choose what you want!:" software selected_software
	echo "`join selected_software`"

	for i in ${selected_software[@]}; do
		case $i in
			"bash")	ln -snf .bashrc $HOME/.bashrc ;;
			"zsh")	ln -snf .zshrc $HOME/.zshrc ;;
			"vim")	ln -snf .vimrc $HOME/.vimrc ;;
			"neovim")
				if [ ! -d $HOME/.config/nvim ]; then
					mkdir $HOME/.config/nvim
				fi
				ln -snf .vimrc $HOME/.config/nvim/init.vim
				;;
			"tmux")	ln -snf .tmux.conf $HOME/.tmux.conf ;;
			"alacritty")	ln -snf .alacritty.yml $HOME/.alacritty.yml ;;
			"wezterm")	ln -snf .wezterm.lua $HOME/.wezterm.lua ;;
			*) ;;
		esac
	done
}

link_root() {
	software=('bash' 'zsh' 'vim' 'neovim' 'tmux')
	checkbox_input "Choose what you want!:" software selected_software
	echo "`join selected_software`"

	for i in ${selected_software[@]}; do
		case $i in
			"bash")	sudo ln -snf .bashrc /root/.bashrc ;;
			"zsh")	sudo ln -snf .zshrc /root/.zshrc ;;
			"vim")	sudo ln -snf .vimrc /root/.vimrc ;;
			"neovim")
				if [ ! -d /root/.config/nvim ]; then
					sudo mkdir /root/.config/nvim
				fi
				sudo ln -snf .vimrc /root/.config/nvim/init.vim
				;;
			"tmux")	sudo ln -snf .tmux.conf /root/.tmux.conf ;;
			*) ;;
		esac
	done
}

target=('user' 'root')
list_input "Choose your target environment:" target selected_target

