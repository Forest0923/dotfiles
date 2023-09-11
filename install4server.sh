#!/bin/sh

DOTFILES=$HOME/dotfiles

ln -snf $DOTFILES/.bashrc $HOME/.bashrc
ln -snf $DOTFILES/server_conf/.bash_profile $HOME/.bash_profile
ln -snf $DOTFILES/.zshrc.pre $HOME/.zshrc.pre
ln -snf $DOTFILES/.zshrc $HOME/.zshrc
ln -snf $DOTFILES/.zshrc.local $HOME/.zshrc.local
ln -snf $DOTFILES/server_conf/.vimrc $HOME/.vimrc
ln -snf $DOTFILES/server_conf/.tmux.conf $HOME/.tmux.conf

