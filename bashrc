#! /bin/bash
set -o vi

. $HOME/.env

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
. $HOME/.fzf.bash

if [ -f $DOTFILES/bash/sensible.bash ]; then
   source $DOTFILES/bash/sensible.bash
fi
# . $DOTFILES/bash/sensible.bash

source $DOTFILES/system/aliases
source $DOTFILES/system/functions

bind "set completion-ignore-case on"
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

. $HOME/.asdf/asdf.sh # adds 5ms
. $HOME/.asdf/completions/asdf.bash
# source $DOTFILES/bash/bash_prompt.bash
eval "$(zoxide init bash)"
eval "$(starship init bash)"
