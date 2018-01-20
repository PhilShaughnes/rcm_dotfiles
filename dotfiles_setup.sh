dotfiles=("vimrc" "zshrc" "tmux.conf")
dir="${HOME}/dotfiles
for dotfile in "${dotfiles[@]}";
 ln -sf "${HOME}/.${dotfile}" "${dir}"
done

ln -s $DOTFILES/vimrc ~/.config/nvim/init.vim
