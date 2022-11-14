default:
	make deploy

bash:
	ln -snfvb $(HOME)/dotfiles/.bashrc $(HOME)/.bashrc
zsh:
	ln -snfvb $(HOME)/dotfiles/.zshrc $(HOME)/.zshrc
vim:
	ln -snfvb $(HOME)/dotfiles/.vimrc $(HOME)/.vimrc
nvim:
	mkdir $(HOME)/.config/nvim
	ln -snfvb $(HOME)/dotfiles/.vimrc $(HOME)/.config/nvim/init.vim
tmux:
	ln -snfvb $(HOME)/dotfiles/.tmux.conf $(HOME)/.tmux.conf
alacritty:
	ln -snfvb $(HOME)/dotfiles/.alacritty.yml $(HOME)/.alacritty.yml
wezterm:
	ln -snfvb $(HOME)/dotfiles/.wezterm.lua $(HOME)/.wezterm.lua

deploy:
	make bash
	make zsh
	make vim
	make nvim
	make tmux

root:
	sudo ln -snfvb $(HOME)/dotfiles/.zshrc /root/.zshrc
	sudo ln -snfvb $(HOME)/dotfiles/.bashrc /root/.bashrc
	sudo ln -snfvb $(HOME)/dotfiles/.vimrc /root/.vimrc
	sudo ln -snfvb $(HOME)/dotfiles/.tmux.conf /root/.tmux.conf
