#! /bin/bash
rm $HOME/.zprofile
ln -sf .dotfiles/.zprofile $HOME/.zprofile
rm $HOME/.zshrc
ln -sf .dotfiles/.zshrc $HOME/.zshrc
rm $HOME/.zshenv
ln -sf .dotfiles/.zshenv $HOME/.zshenv
rm $HOME/.tmux.conf
ln -sf .dotfiles/.tmux.conf $HOME/.tmux.conf
rm $HOME/.gitignore
ln -sf .dotfiles/.gitignore $HOME/.gitignore
rm $HOME/.gitconfig
ln -sf .dotfiles/.gitconfig $HOME/.gitconfig
