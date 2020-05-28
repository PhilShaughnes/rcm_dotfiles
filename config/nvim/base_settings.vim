"**************"
"** SETTINGS **"
"**************"

filetype indent on
set autoread
set autowrite
set clipboard=unnamed     " use the system clipboard as default
set completeopt=menu,preview " longest ",noselect
set expandtab
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
set omnifunc=syntaxcomplete#Complete
set ruler
set shiftround            " always indent/outdent to the nearest tabstop
set shiftwidth=2          " indent/outdent by 2 columns
set shortmess=a
set smartcase             " Make searches case-insensitive
set smarttab              " use tabs at the start of a line, spaces elseware
set softtabstop=2         " unify
set splitbelow
set splitright
set tabstop=2             " tab spacing
set thesaurus+=$DOTFILES/vetc/thesaurii.txt

if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

