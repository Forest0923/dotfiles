#!/bin/sh

DOTFILES=$HOME/dotfiles

ln -snf $DOTFILES/.bashrc $HOME/.bashrc
ln -snf $DOTFILES/server_conf/.bash_profile $HOME/.bash_profile
ln -snf $DOTFILES/zsh/.zshrc.pre $HOME/.zshrc.pre
ln -snf $DOTFILES/zsh/.zshrc $HOME/.zshrc
ln -snf $DOTFILES/zsh/.zshrc.local $HOME/.zshrc.local
ln -snf $DOTFILES/server_conf/.vimrc $HOME/.vimrc
ln -snf $DOTFILES/server_conf/.tmux.conf $HOME/.tmux.conf

