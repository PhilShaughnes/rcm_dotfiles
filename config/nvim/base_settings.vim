"**************"
"** SETTINGS **"
"**************"

filetype indent on
set autoread
set autowrite
set clipboard=unnamed     " use the system clipboard as default
set completeopt=menu,preview " longest ",noselect
set gdefault              " apply substitutions globally on lines
set hidden                " allow unsaved buffers when switching
set hlsearch              " Don't continue to highlight searched phrases.
" set inccommand=nosplit  " can't use this with traces.vim
set incsearch             " But do highlight as you type your search.
set laststatus=2
set lazyredraw            " redraw ony when needed to
set linebreak
set list listchars=tab:»\ ,trail:·,nbsp:· ",eol:¬ ,space:· " display extra white space
set mouse=a
set nobackup
set noswapfile
set nowrap                " don't wrap text
set number                " show line numbers
set relativenumber        " not sure if I really want this...
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
set thesaurus+=$DOTFILES/vetc/thesaurii.txt
set signcolumn=yes
set colorcolumn=80
set scrolloff=8
set undofile
set undodir=$HOME/.config/nvim/.vimundo


if executable('rg')
  set grepprg=rg\ --smart-case\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

set omnifunc=syntaxcomplete#Complete "does this even work?
