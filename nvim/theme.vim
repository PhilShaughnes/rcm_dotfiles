"" Theme ""

if has('nvim') || has('termguicolors')
  set termguicolors
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
  set t_Co=256
  let g:rehash256 = 1
endif

set background=dark
colorscheme base16-monokai
"hi LineNr ctermfg=237 ctermbg=NONE guifg=#424146 guibg=NONE
hi nonText ctermfg=237 ctermbg=NONE guifg=#363636 guibg=NONE
hi CursorLine ctermbg=242 ctermfg=NONE guifg=NONE guibg=#303030
hi ColumnLine ctermbg=242 ctermfg=NONE guifg=NONE guibg=#303030
hi CursorLineNr ctermfg=221 guifg=#dcf074
hi Error ctermfg=white guifg=white
