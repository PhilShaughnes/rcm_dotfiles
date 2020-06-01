"************"
"** KEYMAP **"
"************"
" Select your Leader key
let mapleader = "\<Space>"
" better completion menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <C-u> <C-x><C-u>
" inoremap <C-m> <C-x><C-l>
inoremap <C-,> <C-x><C-o>
inoremap <C-.> <C-x><C-t>
inoremap <C-f> <C-x><C-f>
inoremap <C-g> <C-x><C-p>

" inoremap ,, <C-x><C-n>

" easier beginning and end of line
noremap H     ^
noremap L     $
" make marks more better (go to column instead of line)
noremap ' `

" <C-e/E> work like E but in insert mode
inoremap <C-e> <esc>ea
" add to end of line
inoremap <C-t> <C-o>mm<C-o>A

" inoremap <C-t> <Esc>/[)}"'\]>]<CR>:nohl<CR>a
" inoremap <C-b> <Esc>?[({"'\[<]<CR>:nohl<CR>i
inoremap <C-h> <left>
inoremap <C-l> <right>
" side scroll
nnoremap <C-H> 5zh
nnoremap <C-L> 5zl

" Y goes to end of line
nnoremap Y y$
" leader space cancels search highlighting
nnoremap <silent> <Leader><Space> :nohlsearch<CR>

" replace all occurences of word under cursor. $= in paragraph
nnoremap <leader>/ :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader>% :%s/\<<C-r>=expand("<cword>")<CR>\>/
vnoremap <leader>/ y:%s/<C-r>"/

" find all occurances of a thing in all open/saved buffers
nnoremap <leader>s :cex []<CR> :silent bufdo grepadd '' % <S-Left><Left><Left>
nnoremap <leader>d :cex []<CR> :silent bufdo grepadd '<C-r><C-w>' %<CR>

" find and replace word under cursor
nnoremap <Leader>z /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap <Leader>Z ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

" buffer switch
nnoremap <leader>l :ls<CR>:b<space>
nnoremap <leader>p :bp<CR>
nnoremap <bs> :b#<CR>
nnoremap <leader>n :bn<CR>

" Q runs default macro
nnoremap Q @q
vnoremap Q :norm @q<cr> @q

" visual up and down
nmap j gj
nmap k gk

" > and < indent in normal and visual mode
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv


" highlight last inserted text
nnoremap gV `[v`]

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" ctrl j and k to move in quickfix windows
" nnoremap <silent> <C-j> :cn<CR>
" nnoremap <silent> <C-k> :cp<CR>


"cycle splits
nnoremap <C-q> <C-w>w

" terminal - go to normal mode
tnoremap <C-\> <C-\><C-n>

" create multi-line enclosed thing with terminating character
inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O

" add to end of line
inoremap ,; <Esc>m`A;<Esc>``a
inoremap ,) <Esc>m`A)<Esc>``a
inoremap ,} <Esc>m`A}<Esc>``a
nnoremap <leader>; m`A;<Esc>``


"****************"
"*** SNIPPETS ***"
"****************"

" move to next <++> and go to insert mode
inoremap  ,<Tab> <Esc>/<++><Enter>"_c4l
vnoremap  ,<Tab> <Esc>/<++><Enter>"_c4l
map  ,<Tab> <Esc>/<++><Enter>"_c4l

"markdown
autocmd FileType markdown inoremap ,[ [](<++>)<C-o>F]





