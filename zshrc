#! /bin/zsh
# zmodload zsh/zprof

. $HOME/.env
. $DOTFILES/system/aliases
. $DOTFILES/system/functions

export ZSH=$DOTFILES/zsh

HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt append_history
setopt extended_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups

setopt autocd
setopt autopushd
setopt Pushdignoredups
setopt no_case_glob
setopt prompt_subst

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# see http://zsh.sourceforge.net/Guide/zshguide06.html for documentation
# Cycle through history based on characters already typed on the line
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# menu style completion
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''

autoload -U colors && colors
# complete kinda fuzzy. expand-or-complete-prefix doesn't look at the right of the cursor
setopt completeinword
#selected completion is inserted
setopt menu_complete

# ALIAS - zsh specific
alias git status='nocorrect git status'
alias gs='nocorrect git status'

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f ~/.config/zsh/zshrc.local ]] && source ~/.config/zsh/zshrc.local

#PACKAGES
# zgen should handle loading compinit for us - if not consider limiting to one a day
# You can customize where you put it but it's generally recommended that you put in $HOME/.zgen
if [[ ! -d ~/.zgen ]];then
    git clone https://github.com/tarjoilija/zgen.git ~/.zgen
fi
source ~/.zgen/zgen.zsh

# if the init script doesn't exist
if ! zgen saved; then
  zgen load subnixr/minimal
  # zgen load zsh-users/zsh-syntax-highlighting # adds roughly 0.04s
  # zgen load zsh-users/zsh-autosuggestions # adds 0.01s
  # zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-completions # adds nothing
  # generate the init script from plugins above
  zgen save
fi
MNML_MAGICENTER=()
MNML_USER_CHAR='❯'
MNML_INSERT_CHAR='❯'
# Components on the left prompt
MNML_PROMPT=(mnml_ssh mnml_jobs mnml_status)
# Components on the right prompt
MNML_RPROMPT=('mnml_cwd 2 0' mnml_git)
# Components shown on info line
MNML_INFOLN=(mnml_jobs mnml_uhp)

# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down


. $HOME/.asdf/asdf.sh
# eval "$(zoxide init zsh)"
# eval "$(starship init zsh)" # add 0.03s
# zprof
