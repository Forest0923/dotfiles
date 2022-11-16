#!/bin/bash
set -e

source lib/inquirer.sh

DOTFILES=`pwd`

link_files() {
	software_user=('bash' 'zsh' 'vim' 'neovim' 'tmux' 'alacritty' 'wezterm')
	software_root=('bash' 'zsh' 'vim' 'neovim' 'tmux')

	checkbox_input "Choose what you want!:" software_$1 selected_software

	case $1 in
		"user")
			DIR=$HOME
			SUDO=""
			;;
		"root") DIR=/root
			SUDO=sudo
			;;
		*)	exit ;;
	esac

	for i in ${selected_software[@]}; do
		case $i in
			"bash")	$SUDO ln -snf $DOTFILES/.bashrc $DIR/.bashrc ;;
			"zsh")	$SUDO ln -snf $DOTFILES/.zshrc $DIR/.zshrc ;;
			"vim")
				$SUDO ln -snf $DOTFILES/.vimrc $DIR/.vimrc
				if [ ! -f ~/.vim/autoload/plug.vim ]; then
					curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
						https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
				fi
				$SUDO ln -sf ~/.vim /root 2> /dev/null || true
				;;
			"neovim")
				! $SUDO test -d $DIR/.config/nvim && $SUDO mkdir $DIR/.config/nvim
				$SUDO ln -snf $DOTFILES/.vimrc $DIR/.config/nvim/init.vim
				;;
			"tmux")	$SUDO ln -snf $DOTFILES/.tmux.conf $DIR/.tmux.conf ;;
			"alacritty")	ln -snf $DOTFILES/.alacritty.yml $DIR/.alacritty.yml ;;
			"wezterm")	ln -snf $DOTFILES/.wezterm.lua $DIR/.wezterm.lua ;;
			*);;
		esac
	done
}

target=('user' 'root')
list_input "Choose your target environment:" target selected_target

link_files $selected_target

