export DOTFILES=$HOME/dotfiles
export ZSH=$DOTFILES/zsh

# COLORS

# #PROMPT
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# EDITOR
export EDITOR=nvim


#PS1="⟩"
#RPS1="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}"

# SETTINGS
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
setopt completeinword

HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt sharehistory
setopt extendedhistory

setopt interactivecomments # pound sign in interactive prompt
setopt auto_cd
setopt correctall
setopt vi
setopt menu_complete

# ALIAS
alias git status='nocorrect git status'
alias gs='nocorrect git status'
alias g='git'
alias go='git checkout'
alias gac='git add -A && git commit -m'
alias v='nvim'

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

#LOCAL
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
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug load

#PROMPT
#source $ZSH/prompt.zsh
