#! /bin/bash -eu
rm -rf $HOME/.pryrc
mkdir ~/.config/pry
ln -sf $HOME/.dotfiles/.pryrc ~/.config/pry/.pryrc
rm -rf $HOME/.zprofile
ln -sf $HOME/.dotfiles/.zprofile $HOME/.zprofile
rm -rf $HOME/.zshrc
ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc
rm -rf $HOME/.zshenv
ln -sf $HOME/.dotfiles/.zshenv $HOME/.zshenv
rm -rf $HOME/.tmux.conf
ln -sf $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
rm -rf $HOME/.agignore
ln -sf $HOME/.dotfiles/.agignore $HOME/.agignore
rm -rf $HOME/.gitignore
ln -sf $HOME/.dotfiles/.gitignore $HOME/.gitignore
rm -rf $HOME/.gitconfig
ln -sf $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
rm -rf $HOME/.config/nvim
ln -sf $HOME/.dotfiles/nvim $HOME/.config/nvim
