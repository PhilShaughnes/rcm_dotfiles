if [[ ! -f ~/.antigen.zsh ]]; then
# COLORS
autoload colors zsh/terminfo
colors

# PROMPT
precmd() { print "" }
PS1="⟩"
RPS1="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}"

# SETTINGS
setopt auto_cd
setopt correctall

# ALIAS
alias git status='nocorrect git status'
alias gs='nocorrect git status'
alias gac='git add -a && git commit -m'
alias v='nvim'

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

#PACKAGES
curl https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen.zsh
fi
source ~/.antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

source prompt