"" Theme ""

if has('nvim') || has('termguicolors')
  set termguicolors
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
  set t_Co=256
  let g:rehash256 = 1
endif

""" base16 monokai theme """
"colorscheme base16-monokai

""hi LineNr ctermfg=237 ctermbg=NONE guifg=#424146 guibg=NONE

"hi nonText ctermfg=237 ctermbg=NONE guifg=#363636 guibg=NONE gui=none cterm=none
"hi CursorLine ctermbg=242 ctermfg=NONE guifg=NONE guibg=#303030
"hi CursorColumn ctermbg=242 ctermfg=NONE guifg=NONE guibg=#303030
"hi CursorLineNr ctermfg=221 guifg=#dcf074
"hi Error ctermfg=white guifg=white

" colorscheme base16-gruvbox-dark-soft
colorscheme two-firewatch
" colorscheme wombat
" colorscheme material-monokai
" set notermguicolors

let g:materialmonokai_italic=1
let g:materialmonokai_subtle_spell=1
hi Comment ctermfg=241 guifg=#777777
hi NonText ctermfg=241 guifg=#595959 ctermbg=NONE guibg=NONE
" set background=dark

hi lineNr ctermbg=NONE guibg=NONE
hi clear SignColumn
hi Normal ctermbg=NONE guibg=NONE
hi ALEErrorSign ctermbg=NONE guibg=NONE
hi ALEWarningSign ctermbg=NONE guibg=NONE
hi GitGutterAdd ctermbg=NONE guibg=NONE
hi GitGutterChangeDelete ctermbg=NONE guibg=NONE
hi GitGutterChange ctermbg=NONE guibg=NONE
hi GitGutterDelete ctermbg=NONE guibg=NONE
hi clear SpellBad
hi SpellBad cterm=underline

set nocursorline

" let g:SnazzyTransparent = 1
if has('gui_running') 
  let g:SnazzyTransparent = 0
  colorscheme two-firewatch
  set guifont=Fira\ Code\ Retina:h10
endif

if has('gui_vimr')
  set background=dark
  colorscheme two-firewatch
  set cursorline
endif
