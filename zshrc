# COLORS
autoload colors zsh/terminfo
colors

## PROMPT
#precmd() { print "" }
#PS1="⟩"
#RPS1="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}"

# SETTINGS
setopt auto_cd
setopt correctall

# ALIAS
alias git status='nocorrect git status'
alias gs='nocorrect git status'
alias g='git'
alias gac='git add -a && git commit -m'
alias v='nvim'

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

#global aliases

#PACKAGES
# You can customize where you put it but it's generally recommended that you put in $HOME/.zplug
if [[ ! -d ~/.zplug ]];then
    git clone https://github.com/b4b4r07/zplug ~/.zplug
fi
source ~/.zplug/init.zsh

zplug "mafredri/zsh-async", from:github, defer:0
zplug "zsh-users/zsh-autosuggestions", from:github

# Load last
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3
#zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug load

#PROMPT
source prompt