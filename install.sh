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
			ln -snf $DOTFILES/.zshrc.pre $HOME/.zshrc.pre
			ln -snf $DOTFILES/.zshrc $HOME/.zshrc
			ln -snf $DOTFILES/.zshrc.local $HOME/.zshrc.local
			case `uname -s` in
				"Darwin")
					ln -snf $DOTFILES/.zshrc.osx.pre $HOME/.zshrc.osx.pre
					ln -snf $DOTFILES/.zshrc.osx $HOME/.zshrc.osx
					;;
				"Linux")
					case `uname -r` in
						*"microsoft"*)
							ln -snf $DOTFILES/.zshrc.wsl $HOME/.zshrc.wsl
							;;
						*"valve"*)
							ln -snf $DOTFILES/.zshrc.steamos.pre $HOME/.zshrc.steamos.pre
							ln -snf $DOTFILES/.zshrc.steamos $HOME/.zshrc.steamos
							;;
						*);;
					esac
					;;
				*);;
			esac
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
			case `uname -s` in
				"Darwin")
					ln -snf $DOTFILES/.tmux.osx.conf $HOME/.tmux.osx.conf
					;;
				"Linux")
					ln -snf $DOTFILES/.tmux.linux.conf $HOME/.tmux.linux.conf
					;;
				*);;
			esac
			;;
		"alacritty")
			case `uname -s` in
				"Darwin")
					ln -snf $DOTFILES/.alacritty.osx.yml $HOME/.alacritty.yml
					;;
				"Linux")
					ln -snf $DOTFILES/.alacritty.yml $HOME/.alacritty.yml
					;;
				*);;
			esac
			;;
		"wezterm")
			case `uname -s` in
				"Darwin")
					ln -snf $DOTFILES/.wezterm.osx.lua $HOME/.wezterm.lua
					;;
				"Linux")
					ln -snf $DOTFILES/.wezterm.lua $HOME/.wezterm.lua
					;;
				*);;
			esac
			;;
		*);;
	esac
done

