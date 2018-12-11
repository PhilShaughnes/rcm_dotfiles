#! /bin/bash
dotfiles=("vimrc" "zshrc" "tmux.conf")
dir=${HOME}/dotfiles
for dotfile in ${dotfiles[@]}; do
 ln -sf ${dir}/${dotfile} ${HOME}/.${dotfile}
done

ln -sf ${dir}/vimrc ~/.config/nvim/init.vim
