
set nocompatible          " for regular vim - turn of vi compatibility
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
syntax enable             " enable syntax highlighting (previously syntax on)
set number                " show line numbers
set laststatus=2          " last window always has a statusline
filetype indent on        " activates indenting for files
set hlsearch              " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
"set wrap linebreak        " wrap text
set breakindent           " indent wrapped text
set breakindentopt=sbr    " turn on showbreak
set showbreak=↪>\         " put these characters in front of the broken line
set cursorcolumn          " highlight the column with the cursor
set cursorline            " highlight the line with the cursor
set clipboard=unnamed     " use the system clipboard as default
set sidescroll=1          " turn on sidescroll
set showcmd               " show command in bottom bar
set wildmenu              " visual autocomplete for command menu
set lazyredraw            " redraw ony when needed to
:set mouse=a              " mouse will work
set autoread              " reload the file if it changed
    au CursorHold * checktime
set autowrite             " auto save when switching buffers


set list listchars=eol:¬,tab:»·,trail:·,nbsp:· " display extra white space
let g:jsx_ext_required = 1

" Select your Leader key
let mapleader = "\<Space>"

nnoremap <leader>, :nohlsearch<CR>
 " jj is escape
inoremap jj <esc>
" J is go to beggining of line
nnoremap J ^
" K is go to end of the line
nnoremap K $
 
" tab (next) and shift-tab (prev) to cycle buffer
map <Tab> :bn<CR>
map <S-Tab> :bp<CR>

" ctrl j and k to move in quickfix windows
" map <C-j> :cn<CR>
" map <C-k> :cp<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


" use ag to search
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"" Theme ""

if has('nvim') || has('termguicolors')
  set termguicolors
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
  set t_Co=256
endif


" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

call plug#begin()       " install with :PlugInstall
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'

Plug 'vim-scripts/ReplaceWithRegister'
Plug 'terryma/vim-multiple-cursors'
Plug 'henrik/vim-indexed-search'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'wellle/targets.vim'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
    nnoremap <leader>f :FZF<CR>
    nnoremap <leader>b :Buffers<CR>

Plug 'jelera/vim-javascript-syntax'

Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'baskerville/bubblegum'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

set background=dark
colorscheme base16-gruvbox-dark-medium
hi LineNr ctermfg=237 ctermbg=NONE guifg=#424146 guibg=NONE
hi nonText ctermfg=237 ctermbg=NONE guifg=#424146 guibg=NONE
hi CursorLineNr ctermfg=221 guifg=#dcf074

set modelines=1
" vim:foldmethod=marker:foldlevel=0
