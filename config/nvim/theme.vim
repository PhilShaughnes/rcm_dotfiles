"*************"
"*** THEME ***"
"*************"

set notermguicolors
set background=dark
colorscheme noctu
set fillchars+=vert:│
set laststatus=2

" hi VertSplit ctermbg=NONE guibg=NONE
set statusline=%6*(%n)%{v:register}\ %f%m\ %8*%{FugitiveHead()}%=
set statusline+=%y\ %p%%\ %6*<>\ %8*%c:%l/%L\ 

