default:
	echo $(HOME)

bash:
	ln -snfvb $(HOME)/dotfiles/.bashrc $(HOME)/.bashrc
zsh:
	ln -snfvb $(HOME)/dotfiles/.zshrc $(HOME)/.zshrc
vim:
	ln -snfvb $(HOME)/dotfiles/.vimrc $(HOME)/.vimrc
emacs:
	ln -snfvb $(HOME)/dotfiles/.emacs $(HOME)/.emacs
tmux:
	ln -snfvb $(HOME)/dotfiles/.tmux.conf $(HOME)/.tmux.conf
alacritty:
	ln -snfvb $(HOME)/dotfiles/.alacritty.yml $(HOME)/.alacritty.yml

vscode:
	ln -snfvb $(HOME)/dotfiles/code/settings.json $(HOME)/.config/Code/User/settings.json
	ln -snfvb $(HOME)/dotfiles/code/keybindings.json $(HOME)/.config/Code/User/keybindings.json

