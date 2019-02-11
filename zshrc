#! /bin/zsh
# zmodload zsh/zprof
export ZSH=$DOTFILES/zsh

source ~/dotfiles/system/aliases
source ~/dotfiles/system/functions
source ~/dotfiles/system/env


# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# PS1="\n%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}\n"
# PS2="⟩"
# source ~/dotfiles/zsh/prompt.zsh

# SETTINGS
autoload -Uz compinit add-zsh-hook
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
zstyle ':completion:*' menu select
setopt completeinword
setopt menu_complete

HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt sharehistory
setopt extendedhistory

setopt interactivecomments # pound sign in interactive prompt
setopt auto_cd
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
[[ -f ~/.config/zsh/zshrc.local ]] && source ~/.config/zsh/zshrc.local

#PACKAGES
# You can customize where you put it but it's generally recommended that you put in $HOME/.zplug
if [[ ! -d ~/.zgen ]];then
    git clone https://github.com/tarjoilija/zgen.git ~/.zgen
fi
source ~/.zgen/zgen.zsh

# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen load mafredri/zsh-async
  zgen load sindresorhus/pure

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-history-substring-search

  zgen load kiurchv/asdf.plugin.zsh

  # generate the init script from plugins above
  zgen save
fi
# PURE_GIT_PULL=0

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
# zprof
