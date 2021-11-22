"**************"
"** SETTINGS **"
"**************"

filetype plugin indent on
syntax enable
set backspace=indent,eol,start
set nocompatible
set autoread
set autoindent
set autowrite
set clipboard=unnamed     " use the system clipboard as default
set complete-=i
set completeopt=menu,preview " longest ",noselect
set gdefault              " apply substitutions globally on lines
set hidden                " allow unsaved buffers when switching
set hlsearch              " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set laststatus=2
set lazyredraw            " redraw ony when needed to
set linebreak
set list listchars=tab:»\ ,trail:·,nbsp:· ",eol:¬ ,space:· " display extra white space
set mouse=a
set wildmenu
set nobackup
set noswapfile
set nowrap                " don't wrap text
set number                " show line numbers
" set relativenumber        " not sure if I really want this...
set ruler
set shiftround            " always indent/outdent to the nearest tabstop
set shiftwidth=2          " indent/outdent by 2 columns
set shortmess=a
set ignorecase            " Make searches case-insensitive
set smartcase             " unless you use capital letters
set expandtab
set smarttab              " use tabs at the start of a line, spaces elseware
set softtabstop=2         " unify
set splitbelow
set splitright
set tabstop=2             " tab spacing
set signcolumn=yes
set colorcolumn=80
set scrolloff=8
set encoding=utf-8
set undofile
set undodir=~/.vim/.vimundo


if executable('rg')
  set grepprg=rg\ --smart-case\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

set omnifunc=syntaxcomplete#Complete "does this even work?

" syntax highlighting for lua and ruby in vimscript
let g:vimsyn_embed = 'lr'

augroup interface
  autocmd!
  autocmd BufNewFile,BufRead * if &syntax == '' | set syntax=sh | endif
  " autocmd InsertEnter,CmdLineEnter * set norelativenumber | redraw
  " autocmd InsertLeave,CmdlineLeave * set relativenumber
augroup END

augroup quickfix
  autocmd!
  " automatic location/quickfix window
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost    l* lwindow
  autocmd VimEnter            * cwindow
augroup END

"*************"
"*** PLUGS ***"
"*************"
" assumes git, nnn, ripgrep, and fzf
" to install run:
" git clone https://github.com/kristijanhusak/vim-packager ~/.vim/pack/packager/opt/vim-packager

" Load packager only when you need it
function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
  " call packager#add('junegunn/fzf', { 'do': './install --all && ln -s $(pwd) ~/.fzf'})
  call packager#local('/usr/local/opt/fzf')
  call packager#add('junegunn/fzf.vim')
  call packager#add('tpope/vim-commentary')                          "comment stuff out with gc (gcc to do a line)
  call packager#add('tpope/vim-fugitive')
	call packager#add('airblade/vim-gitgutter')
  call packager#add('rstacruz/vim-closer')
  call packager#add('tpope/vim-endwise')
  call packager#add('romainl/vim-cool')
  call packager#add('junegunn/vim-peekaboo')                         " peak at registers with \" and @ and <C-R>>
  call packager#add('markonm/traces.vim')
  call packager#add('machakann/vim-sandwich')
  call packager#add('kana/vim-niceblock')                            " make A and I work for all visual modes
  call packager#add('mcchrish/nnn.vim')

  call packager#add('romainl/vim-qlist')
  call packager#add('romainl/vim-qf')
  call packager#add('ojroques/vim-oscyank')

  call packager#add('mtdl9/vim-log-highlighting')
	call packager#add('noahfrederick/vim-noctu')
endfunction

" These commands are automatically added when using `packager#setup()`
command! -nargs=* -bar PackagerInstall call PackagerInit() | call packager#install(<args>)
command! -nargs=* -bar PackagerUpdate call PackagerInit() | call packager#update(<args>)
command! -bar PackagerClean call PackagerInit() | call packager#clean()
command! -bar PackagerStatus call PackagerInit() | call packager#status()
"
" Fugitive
nnoremap <leader>gg :Git<CR>
" vimcool
let g:CoolTotalMatches = 1
"qf
nmap <C-k> <Plug>(qf_qf_previous)
nmap <C-j> <Plug>(qf_qf_next)
nmap <leader>k <Plug>(qf_loc_previous)
nmap <leader>j <Plug>(qf_loc_next)
nmap \|\| <Plug>(qf_loc_toggle)
nmap \\ <Plug>(qf_qf_toggle)
"nnn
let g:nnn#set_default_mappings = 0
let g:nnn#layout = { 'window': { 'width': 0.5, 'height': 0.7, 'highlight': 'Debug' } }
let g:nnn#command = 'nnn -e'
let g:nnn#replace_netrw = 1
let g:nnn#session = 'local'
nnoremap - :call nnn#pick(expand('%:p:h'), { 'layout': 'enew' })<CR>
nnoremap <leader>nw :call nnn#pick(getcwd(), { 'layout': 'enew' })<CR>
nnoremap <leader>nr :call nnn#pick(getcwd(), { 'layout': {'left': '~20%'} })<CR>
nnoremap <leader>nl :call nnn#pick(expand('%:p:h'), { 'layout': {'left': '~20%'} })<CR>
nnoremap <leader>nm :call nnn#pick(expand('%:p:h'))<CR>
nnoremap <leader>nn :call nnn#pick(getcwd())<CR>
"oscyank
vnoremap <leader>c :OSCYank<CR>

" FZF settings:
nnoremap <leader>ff :Files<CR>
" nnoremap <leader>t :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>ft :Rg<CR>
" nnoremap <leader>m :RG<CR>

  " Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
    \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
    \   <bang>0)

  " Likewise, Files command with preview window
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"************"
"** KEYMAP **"
"************"
" NOTE ON MAPPINGS:
" <C-b> and <C-f> are page up and page down, but I usually use <C-u> and <C-d>
" So those two should be available for mappings

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
" inoremap <C-t> <C-o>mm<C-o>A
" move outside next closing thing
inoremap <C-t> <esc>/[)}"'\]>]<CR>:nohlsearch<CR>a


" this is a (test line to) see how stuff goes
" really want to get simple slurp and barf...
" not so simple - need to distinguish opening closing - if delimiter belongs
" at beggining or end of words
nnoremap ) /[)(}{"'\]\[><]<CR>:nohl<CR>
nnoremap ( ?[(){}"'\[\]<>]<CR>:nohl<CR>
nnoremap <leader>0 "pdiwwe"pp
nnoremap <leader>9 "pdiwbi<c-r>p<esc>
" nnoremap <C-)>
" nnoremap <C-(>
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
" nnoremap <silent> <Leader><Space> :nohlsearch<CR>
" jk toggles cursorcolumn and cursorline
nnoremap <silent> <leader><space> :set relativenumber!<bar> set list!<CR>
nnoremap <silent> z/ :set cursorcolumn! <bar> set cursorline!<CR>

" replace all occurences of word under cursor. $= in paragraph
nnoremap <leader>/ :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader>% :%s/\<<C-r>=expand("<cword>")<CR>\>/
vnoremap <leader>/ y:%s/<C-r>"/
vnoremap <leader>* y/<C-r>"

" find all occurances of a thing in all open/saved buffers
nnoremap <leader>s :cex []<CR> :silent bufdo grepadd '' % <S-Left><Left><Left>
nnoremap <leader>d :cex []<CR> :silent bufdo grepadd '<C-r><C-w>' %<CR>

" find and replace word under cursor
nnoremap <Leader>z /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap <Leader>Z ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

" buffer switch
nnoremap <leader>l :ls<CR>:b<space>
nnoremap <leader>bl :ls<CR>:b<space>
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
" nnoremap <silent> <leader>j :ln<CR>
" nnoremap <silent> <leader>k :lp<CR>


"cycle splits
nnoremap <C-q> <C-w>w

"open current buffer in new tab (preserves existing pane configuration
nnoremap <c-w>m :tab split<CR>

" inoremap { {}<Esc>ha
" inoremap ( ()<Esc>ha
" inoremap [ []<Esc>ha
" inoremap " ""<Esc>ha
" inoremap ' ''<Esc>ha
" inoremap ` ``<Esc>ha

" navigate to nearest character in list

" create multi-line enclosed thing with terminating character
" inoremap (; (<CR>);<C-c>O
" inoremap (, (<CR>),<C-c>O
" inoremap {; {<CR>};<C-c>O
" inoremap {, {<CR>},<C-c>O
" inoremap [; [<CR>];<C-c>O
" inoremap [, [<CR>],<C-c>O

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
autocmd FileType markdown inoremap ]] [](<++>)<C-o>F]
autocmd FileType markdown inoremap [[ [[]]<++><C-o>2F]


"*************"
"*** THEME ***"
"*************"

set notermguicolors
set background=dark
" colorscheme monokai
colorscheme noctu
set fillchars+=vert:│
set laststatus=2

" hi VertSplit ctermbg=NONE guibg=NONE
set statusline=%6*(%n)%{v:register}\ %f%m\ %8*%{FugitiveHead()}%=
set statusline+=%y\ %p%%\ %6*<>\ %8*%c:%l/%L\ 

" new
