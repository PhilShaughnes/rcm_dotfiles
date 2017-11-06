execute pathogen#infect()

set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme monokai       " set colorscheme
set number                " show line numbers
set laststatus=2          " last window always has a statusline
filetype indent on        " activates indenting for files
set nohlsearch            " Don't continue to highlight searched phrases.
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
set cursorcolumn          " highlight the column with the cursor
set cursorline            " highlight the line with the cursor
set clipboard=unnamed     " use the system clipboard as default



" Select your Leader key
let mapleader = "\<Space>"

" fzf
" let $FZF_DEFAULT_COMMAND = 'ag -g ""' "ignore hidden by default
" nnoremap <Leader>o :FZF<CR>           " fzf in current folder
" nmap <Leader>f :Ag<CR>                " search with ag

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif



:set mouse=a
" Display extra whitespace
set list listchars=eol:¬,tab:»·,trail:·,nbsp:·
",space:·

"colorscheme monokai desert
"autocmd ColorScheme * highlight Normal ctermbg=None
"autocmd ColorScheme * highlight NonText ctermbg=None
"autocmd ColorScheme * highlight SpecialKey links to NonText

autocmd! FileType c,cpp,java,php call CSyntaxAfter()
