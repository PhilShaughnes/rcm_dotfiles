#! /bin/zsh
# zmodload zsh/zprof

source $HOME/.env
source $DOTFILES/system/aliases
source $DOTFILES/system/functions

export ZSH=$DOTFILES/zsh

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# PS1="❯❯ "
# RPS1="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}"

# SETTINGS
# see http://zsh.sourceforge.net/Guide/zshguide06.html for documentation

# smart-case completion?
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# give us a killall command menu
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
# menu style completion
zstyle ':completion:*' menu select
# complete kinda fuzzy. expand-or-complete-prefix doesn't look at the right of the cursor
setopt completeinword
#selected completion is inserted
setopt menu_complete

HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt sharehistory
setopt extendedhistory

setopt interactivecomments # pound sign in interactive prompt
setopt auto_cd
setopt auto_pushd
setopt correctall
setopt vi

setopt prompt_subst

# ALIAS - zsh specific
alias git status='nocorrect git status'
alias gs='nocorrect git status'


#LAZY - enable lazy loading - just do "lazy_load" (no quotes) before a command
# source $ZSH/lazy.zsh

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

#LOCAL - pull in local settings
# example: hash -d code="$HOME/code"
[[ -f ~/.config/zsh/zshrc.local ]] && source ~/.config/zsh/zshrc.local

# # zgen should handle this for us... I think
# # outside of that, this says only do the compinit stuff if we haven't done it today
# autoload -Uz compinit add-zsh-hook
# if [ $(date '+%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
#   compinit
# else
#   compinit -C
# fi

#PACKAGES
# You can customize where you put it but it's generally recommended that you put in $HOME/.zgen
if [[ ! -d ~/.zgen ]];then
    git clone https://github.com/tarjoilija/zgen.git ~/.zgen
fi
source ~/.zgen/zgen.zsh

# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  # zgen load mafredri/zsh-async
  # zgen load sindresorhus/pure
  zgen load subnixr/minimal

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-history-substring-search

  # generate the init script from plugins above
  zgen save
fi

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

. $HOME/.asdf/asdf.sh

# zprof
