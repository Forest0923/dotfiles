#!/bin/sh
set -e

source lib/inquirer.sh

DOTFILES=`pwd`

link_user() {
	software=('bash' 'zsh' 'vim' 'neovim' 'tmux' 'alacritty' 'wezterm')
	checkbox_input "Choose what you want!:" software selected_software

	for i in ${selected_software[@]}; do
		case $i in
			"bash")	ln -snf $DOTFILES/.bashrc $HOME/.bashrc ;;
			"zsh")	ln -snf $DOTFILES/.zshrc $HOME/.zshrc ;;
			"vim")	ln -snf $DOTFILES/.vimrc $HOME/.vimrc ;;
			"neovim")
				if [ ! -d $HOME/.config/nvim ]; then
					mkdir $HOME/.config/nvim
				fi
				ln -snf $DOTFILES/.vimrc $HOME/.config/nvim/init.vim
				;;
			"tmux")	ln -snf $DOTFILES/.tmux.conf $HOME/.tmux.conf ;;
			"alacritty")	ln -snf $DOTFILES/.alacritty.yml $HOME/.alacritty.yml ;;
			"wezterm")	ln -snf $DOTFILES/.wezterm.lua $HOME/.wezterm.lua ;;
			*) ;;
		esac
	done
}

link_root() {
	software=('bash' 'zsh' 'vim' 'neovim' 'tmux')
	checkbox_input "Choose what you want!:" software selected_software

	for i in ${selected_software[@]}; do
		case $i in
			"bash")	sudo ln -snf $DOTFILES/.bashrc /root/.bashrc ;;
			"zsh")	sudo ln -snf $DOTFILES/.zshrc /root/.zshrc ;;
			"vim")	sudo ln -snf $DOTFILES/.vimrc /root/.vimrc ;;
			"neovim")
				if [ ! -d /root/.config/nvim ]; then
					sudo mkdir /root/.config/nvim
				fi
				sudo ln -snf $DOTFILES/.vimrc /root/.config/nvim/init.vim
				;;
			"tmux")	sudo ln -snf $DOTFILES/.tmux.conf /root/.tmux.conf ;;
			*) ;;
		esac
	done
}

target=('user' 'root')
list_input "Choose your target environment:" target selected_target

link_$selected_target

