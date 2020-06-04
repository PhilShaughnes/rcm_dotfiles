"**************"
"** SETTINGS **"
"**************"
source $DOTFILES/config/nvim/base_settings.vim

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

source $DOTFILES/config/nvim/augroups.vim
source $DOTFILES/config/nvim/keymaps.vim
" source $DOTFILES/config/nvim/plugs.vim
" source $DOTFILES/config/nvim/mod_plugs.vim
source $DOTFILES/config/nvim/myplugins.vim

source $DOTFILES/config/nvim/theme.vim
" source $DOTFILES/vetc/airline_config.vim


" let g:airline_theme='angr'
" set termguicolors
" colorscheme dracula


