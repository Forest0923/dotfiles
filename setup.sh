#!/bin/bash
ln -snfv $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -snfv $HOME/dotfiles/.emacs $HOME/.emacs
ln -snfv $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -snfv $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
    
if ! grep -qE "(Microsoft|WSL)" /proc/version; then
    ln -snfv $HOME/dotfiles/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
    ln -snfv $HOME/dotfiles/vscode/settings.json $HOME/.config/Code/User/settings.json
fi
