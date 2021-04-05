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

" source $DOTFILES/config/nvim/theme.vim
" source $DOTFILES/vetc/airline_config.vim


" let g:airline_theme='angr'
" set termguicolors
" colorscheme sonokai
" colorscheme gruvbox-material
colorscheme edge


