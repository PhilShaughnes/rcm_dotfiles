"**************"
"** SETTINGS **"
"**************"
source $DOTFILES/config/nvim/base_settings.vim

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif
set termguicolors
" syntax highlighting for lua and ruby in vimscript
let g:vimsyn_embed = 'lr'

source $DOTFILES/config/nvim/augroups.vim
source $DOTFILES/config/nvim/keymaps.vim
source $DOTFILES/config/nvim/plugs.vim
" source $DOTFILES/config/nvim/mod_plugs.vim
" source $DOTFILES/config/nvim/dev_plugs.vim
" lua require 'bootstrap'
" lua require 'plugins'
" source $DOTFILES/config/nvim/myplugins.vim

" source $DOTFILES/config/nvim/theme.vim
set background=dark
" source $DOTFILES/vetc/airline_config.vim

" colorscheme sonokai
" colorscheme edge
colorscheme gruvbox-material
" colorscheme monokai

