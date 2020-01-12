#! /bin/bash
rm -rf $HOME/.zprofile
ln -sf .dotfiles/.zprofile $HOME/.zprofile
rm -rf $HOME/.zshrc
ln -sf .dotfiles/.zshrc $HOME/.zshrc
rm -rf $HOME/.zshenv
ln -sf .dotfiles/.zshenv $HOME/.zshenv
rm -rf $HOME/.tmux.conf
ln -sf .dotfiles/.tmux.conf $HOME/.tmux.conf
rm -rf $HOME/.gitignore
ln -sf .dotfiles/.gitignore $HOME/.gitignore
rm -rf $HOME/.gitconfig
ln -sf .dotfiles/.gitconfig $HOME/.gitconfig
rm -rf $HOME/.config/nvim
ln -sf .dotfiles/nvim $HOME/.config/nvim
