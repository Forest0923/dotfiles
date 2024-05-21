#!/bin/bash
set -e

source lib/inquirer.sh

DOTFILES=`pwd`
software=('bash' 'zsh' 'vim' 'neovim' 'tmux' 'alacritty' 'wezterm' 'bat' 'zellij')

checkbox_input "Choose what you want!:" software selected_software

for i in ${selected_software[@]}; do
	case $i in
		"bash")	ln -snf $DOTFILES/.bashrc $HOME/.bashrc ;;
		"zsh")
			ln -snf $DOTFILES/zsh/.zshrc.pre $HOME/.zshrc.pre
			ln -snf $DOTFILES/zsh/.zshrc $HOME/.zshrc
			ln -snf $DOTFILES/zsh/.zshrc.local $HOME/.zshrc.local
			case `uname -s` in
				"Darwin")
					ln -snf $DOTFILES/zsh/.zshrc.osx.pre $HOME/.zshrc.osx.pre
					ln -snf $DOTFILES/zsh/.zshrc.osx $HOME/.zshrc.osx
					;;
				"Linux")
					case `uname -r` in
						*"microsoft"*)
							ln -snf $DOTFILES/zsh/.zshrc.wsl $HOME/.zshrc.wsl
							;;
						*"valve"*)
							ln -snf $DOTFILES/zsh/.zshrc.steamos.pre $HOME/.zshrc.steamos.pre
							ln -snf $DOTFILES/zsh/.zshrc.steamos $HOME/.zshrc.steamos
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
			ln -snf $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf
			if [ ! -d ~/.tmux/plugins/tpm ]; then
				git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
			fi
			case `uname -s` in
				"Darwin")
					ln -snf $DOTFILES/tmux/.tmux.osx.conf $HOME/.tmux.osx.conf
					;;
				"Linux")
					ln -snf $DOTFILES/tmux/.tmux.linux.conf $HOME/.tmux.linux.conf
					ln -snf $DOTFILES/ssh/rc $HOME/.ssh/rc
					;;
				*);;
			esac
			;;
		"alacritty")
			case `uname -s` in
				"Darwin")
					ln -snf $DOTFILES/terminal_configs/.alacritty.osx.yml $HOME/.alacritty.yml
					;;
				"Linux")
					ln -snf $DOTFILES/terminal_configs/.alacritty.yml $HOME/.alacritty.yml
					;;
				*);;
			esac
			;;
		"wezterm")
			case `uname -s` in
				"Darwin")
					ln -snf $DOTFILES/terminal_configs/.wezterm.osx.lua $HOME/.wezterm.lua
					;;
				"Linux")
					ln -snf $DOTFILES/terminal_configs/.wezterm.lua $HOME/.wezterm.lua
					;;
				*);;
			esac
			;;
		"bat")
			case `uname -s` in
				"Darwin" | "Linux")
					ln -snf $DOTFILES/bat/config $HOME/.config/bat/config
					;;
				*);;
			esac
			;;
		"zellij")
			case `uname -s` in
				"Linux")
					ln -snf $DOTFILES/zellij/config.kdl $HOME/.config/zellij/config.kdl
					;;
				*);;
			esac
			;;
		*);;
	esac
done

