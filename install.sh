#!/usr/bin/env bash

# let script exit if a command fails
set -e

cd ~/

echo "Installing the Utlimate Dotfiles..."
echo "Updating brew"
brew update

echo "Upgrading brew"
brew upgrade

PACKAGES=(
  coreutils
  cowsay
  fortune
  git-standup
  hub
  lolcat
  vim
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Installing casks..."
brew cask install sampler

echo "Cleaning up..."
brew cleanup

echo "Installing Ruby gems..."
sudo gem install lolcat

echo "Install vim plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Clone Powerline Fonts..."
git clone https://github.com/powerline/fonts.git --depth=1

echo "Install Powerline Fonts"
cd fonts
./install.sh

echo "Clean-up Powerline Fonts"
cd ..
rm -rf fonts

echo "Create symbolic links to configurations"
ln -sf .dotfiles/.bash_profile
ln -sf .dotfiles/.gitconfig
ln -sf .dotfiles/.vimrc
ln -sf .dotfiles/.pqslrc

echo "Finished"
exit 0
