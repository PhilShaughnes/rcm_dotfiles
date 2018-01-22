export DOTFILES=$HOME/dotfiles
export ZSH=$DOTFILES/zsh

# COLORS

# #PROMPT
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# EDITOR
export EDITOR=nvim

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line


#PS1="⟩"
#RPS1="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}"

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

# ALIAS
alias git status='nocorrect git status'
alias gs='nocorrect git status'
alias g='git'
alias gco='git checkout'
alias gac='git add -A && git commit -m'
alias v='nvim'

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

#LAZY - enable lazy loading - just do "lazy_load" (no quotes) before a command
source $ZSH/lazy.zsh

#LOCAL - pull in local settings
[[ -f ~/.config/zsh/zshrc.local ]] && source ~/.config/zsh/zshrc.local

#PACKAGES
# You can customize where you put it but it's generally recommended that you put in $HOME/.zplug
if [[ ! -d ~/.local/share/zplug ]];then
    git clone https://github.com/b4b4r07/zplug ~/.local/share/zplug
fi
source ~/.local/share/zplug/init.zsh

zplug "mafredri/zsh-async", from:github, defer:0
zplug "zsh-users/zsh-autosuggestions", from:github

# Load last
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3
# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "molovo/filthy", use:filthy.zsh, from:github, as:theme

zplug load

#PROMPT
#source $ZSH/prompt.zsh
export PATH=/Users/phil/.local/share/zplug/bin:/Users/phil/.nvm/versions/node/v6.10.2/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
