#!/bin/bash

BACKUP_DIR = ~/.local/backups
DOTFILES = ~/dotfiles

echo "-= Installing System Dependencies =-"
brew install zsh tmux neovim python3 ag fzf
brew tap caskroom/cask
brew cask install iterm2

echo "-= Installing Fonts =-"
brew tap caskroom/fonts
brew cask install font-fira-code

echo "-= Assigning Zsh as Default Shell =-"
chsh -s $(which zsh)

echo "-= Upgrading NeoVim with Python and Package Manager =-"
pip3 install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "-= Setting Zsh as default shell =-"
chsh -s /usr/local/bin/zsh

echo "-= Creating backup director at $BACKUP_DIR =-"
mkdir -p $BACKUP_DIR

echo "-= Backup any existing configs =-"
files=("~/.vim" "~/.vimrc" "~/.zshrc" "~/.tmux" "~/.tmux.conf" "~/.config/nvim/init.vim")
for files in $files; do
    if [ ! -L $filename ]; then
        echo "backing up $file"
        mv -fg $file $BACKUP_DIR
    else
        echo -e "$filename does not exist at this location or is a symlink"
    fi
done


echo "-= Creating necessary directories =-"
    mkdir -p ~/.config/nvim

echo "-= Symlinking new configs =-"
ln -s $DOTFILES/zshrc ~/.zshrc
ln -s $DOTFILES/tmux.conf ~/.tmux.conf
ln -s $DOTFILES/vimrc ~/.config/nvim/init.vim

echo "-= Log out and Log Back In to see changes =-"