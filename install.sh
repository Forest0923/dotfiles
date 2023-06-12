#!/bin/bash
set -e

source lib/inquirer.sh

DOTFILES=`pwd`
software=('bash' 'zsh' 'vim' 'neovim' 'tmux' 'alacritty' 'wezterm')

checkbox_input "Choose what you want!:" software selected_software

for i in ${selected_software[@]}; do
	case $i in
		"bash")	ln -snf $DOTFILES/.bashrc $HOME/.bashrc ;;
		"zsh")
			ln -snf $DOTFILES/.zshrc $HOME/.zshrc
			ln -snf $DOTFILES/.zshrc.local $HOME/.zshrc.local
			;;
		"vim")
			ln -snf $DOTFILES/.vimrc $HOME/.vimrc
			if [ ! -f ~/.vim/autoload/plug.vim ]; then
				curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
					https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
			fi
			;;
		"neovim")
			! test -d $HOME/.config/nvim && mkdir -p $HOME/.config/nvim
			ln -snf $DOTFILES/.vimrc $HOME/.config/nvim/init.vim
			if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
				sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
					https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
			fi
			;;
		"tmux")
			ln -snf $DOTFILES/.tmux.conf $HOME/.tmux.conf
			ln -snf $DOTFILES/.tmux.osx.conf $HOME/.tmux.osx.conf
			ln -snf $DOTFILES/.tmux.linux.conf $HOME/.tmux.linux.conf
			;;
		"alacritty")	ln -snf $DOTFILES/.alacritty.yml $HOME/.alacritty.yml ;;
		"wezterm")	ln -snf $DOTFILES/.wezterm.lua $HOME/.wezterm.lua ;;
		*);;
	esac
done

