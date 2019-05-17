#! /bin/bash
set -o vi

. $HOME/.env

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f $DOTFILES/bash/sensible.bash ]; then
   source $DOTFILES/bash/sensible.bash
fi


source $DOTFILES/bash/bash_prompt.bash

source $DOTFILES/system/aliases
source $DOTFILES/system/functions

bind "set completion-ignore-case on"
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
