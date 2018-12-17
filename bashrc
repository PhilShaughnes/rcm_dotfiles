#! /bin/bash
set -o vi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f ~/dotfiles/bash/sensible.bash ]; then
   source ~/dotfiles/bash/sensible.bash
fi


source ~/dotfiles/bash/bash_prompt.bash

source ~/dotfiles/system/aliases
source ~/dotfiles/system/functions
source ~/dotfiles/system/env

bind "set completion-ignore-case on"
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
