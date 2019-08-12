" {{{ SETTINGS
syntax enable             " enable syntax highlighting (previously syntax on)
filetype plugin on " filetype detection[ON] plugin[ON] indent[ON]
set number                " show line numbers
set encoding=utf-8
set laststatus=2          " last window always has a statusline
filetype indent on        " activates indenting for files
set hlsearch              " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set gdefault              " apply substitutions globally on lines
set ignorecase
set smartcase            " Make searches case-insensitive.
set spelllang=en_us
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
"set wrap linebreak        " wrap text
set breakindent           " indent wrapped text
set breakindentopt=sbr    " turn on showbreak
set showbreak=↪>\         " put these characters in front of the broken line
"set cursorcolumn          " highlight the column with the cursor
"set cursorline            " highlight the line with the cursor
set clipboard=unnamed     " use the system clipboard as default
set sidescroll=1          " turn on sidescroll
set scrollopt="ver,hor,jump"
set showcmd               " show command in bottom bar
set wildmenu              " visual autocomplete for command menu
set lazyredraw            " redraw ony when needed to
:set mouse=a              " mouse will work
set autoread              " reload the file if it changed
   " check for and load file changes
autocmd WinEnter,BufWinEnter,FocusGained * checktime
set autowrite             " auto save when switching buffers
set hidden                " allow unsaved buffers when switching
" save ov focus lost
:au FocusLost * silent! wa

autocmd BufEnter term://* startinsert
:augroup TermOpen
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
:augroup END


set linespace=5
set title
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" disable swapfile to avoid errors on load
set noswapfile
set nobackup

set list listchars=tab:»\ ,trail:·,nbsp:· ",eol:¬ ,space:· " display extra white space

" use ripgrep to search
if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif


"}}}

"{{{ KEYMAPS
" make marks more better (go to column instead of line)
nnoremap ' `
" Y goes to end of line
nnoremap Y y$
" Select your Leader key
let mapleader = "\<Space>"
" Enter cancels search highlighting
nnoremap <silent> <Leader><Space> :nohlsearch<CR>
" nnoremap , :nohlsearch<CR>

nnoremap <leader>$ :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader>% :%s/\<<C-r>=expand("<cword>")<CR>\>/

" ]<Space> inserts new line below
nmap <leader>o m`o<Esc>``
" [<Space> inserts new line above
nmap <leader>O m`O<Esc>``
 " jj is escape
inoremap jj <C-\><C-n>
" inoremap <C-i> <C-\><C-n>

inoremap <C-g><Space> <Esc>/<++><Enter>"_c4l
" Q runs default macro
nnoremap Q @q
" visual up and down
nmap j gj
nmap k gk

" buffer switch
nnoremap <leader>l :ls<CR>:b<space>

nnoremap ,b         :buffer *
nnoremap ,B         :sbuffer *

" Tab and S-Tab indent in normal and visual mode
" nnoremap <Tab>   >>
" nnoremap <S-Tab> <<
" vnoremap <Tab>   >><Esc>gv
" vnoremap <S-Tab> <<<Esc>gv

nnoremap > >>
nnoremap < <<
vnoremap > >><Esc>gv
vnoremap < <<<Esc>gv


" vnoremap <leader>s "ry:call system('tmux send-keys -t .+ "echo <c-r>r" Enter')<CR>
" nmap <leader>m :call system('tmux send-keys -t .+ "

" <C-e/E> work like E but in insert mode
inoremap <C-e> <ESC>ea
inoremap <C-t> <Esc>/[)}"'\]>]<CR>:nohl<CR>a
inoremap <C-b> <Esc>?[({"'\[<]<CR>:nohl<CR>i

" highlight last inserted text
nnoremap gV `[v`]

noremap H     ^
noremap L     $

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" paste over highlighted text and retain copied text
vnoremap <leader>p "_dP
" paste last yanked text (not deleted)
nnoremap <leader>v "0p
" leader w is kill buffer
nnoremap <leader>w :bp\|sp\|bn\|bd <CR>

" terminal - jj goes to normal mode
tnoremap jj <C-\><C-n>
" terminal - go to normal mode
tnoremap <C-\> <C-\><C-n>


" tab (next) and shift-tab (prev) to cycle buffer
nmap <leader><Tab> :bn<CR>
nmap <leader><S-Tab> :bp<CR>

" buffer switch
nnoremap <leader>l :ls<CR>:b<space>
nnoremap <leader>p :bp<CR>
nnoremap <BS> :b#<CR>
nnoremap <leader>n :bn<CR>


" ctrl j and k to move in quickfix windows
nnoremap <silent> <C-j> :cn<CR>
nnoremap <silent> <C-k> :cp<CR>
nnoremap <silent> \\ :copen<CR>
nnoremap <silent> \|\| :cclose<CR>

 " SPLITS
set splitbelow
set splitright
" nnoremap <bs> <C-W>w
nnoremap <C-q> <C-w>w

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ve :e $MYVIMRC<CR>
nnoremap <silent> <leader>vs :so $MYVIMRC<CR>

inoremap <C-\> ✓✗

" side scroll
nnoremap <C-H> 5zh
nnoremap <C-L> 5zl
nnoremap <C-h> ^
nnoremap <C-l> $

augroup quickfix
  autocmd!
  " automatic location/quickfix window
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost    l* lwindow
  autocmd VimEnter            * cwindow
augroup END


"}}}

" {{{ PLUGINS

call plug#begin('~/.local/share/nvim/plugged')       " install with :PlugInstall
Plug 'tpope/vim-sleuth'                              "auto detects and sets shiftwidth, expandtab, etc.
Plug 'tpope/vim-fugitive'
    nnoremap <leader>g :Gstatus<CR>
Plug 'tpope/vim-commentary'                          "comment stuff out with gc (gcc to do a line)
Plug 'tpope/vim-endwise'                             "auto add end to stuffs

Plug 'romainl/vim-qlist'
Plug 'romainl/vim-qf'
Plug 'https://gitlab.com/hauleth/qfx.vim'

Plug 'machakann/vim-sandwich'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'

Plug 'terryma/vim-multiple-cursors'

" replace ALE with vim built-in makeprg - WIP
Plug 'igemnace/vim-makery'
Plug 'hauleth/asyncdo.vim'
  command! -bang -nargs=* -complete=file Make call asyncdo#run(<bang>0, &makeprg, <f-args>)
  command! -bang -nargs=* -complete=file LMake call asyncdo#lrun(<bang>0, &makeprg, <f-args>)
  augroup Linting
    autocmd!
    autocmd FileType javascript setlocal makeprg=./node_modules/.bin/eslint\ --format\ compact
    autocmd Filetype javascript setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
  augroup END



" Plug 'slashmili/alchemist.vim'
" let g:ale_elixir_elixir_ls_release = '/Users/phil/Documents/codes/elixir/elixir-ls/rel'
" let g:ale_completion_enabled = 1
Plug 'w0rp/ale'
    " let g:ale_elixir_elixir_ls_release = '/Users/phil/Documents/code/elixir/elixir-ls/rel'
    " autocmd FileType elixir nnoremap <c-]> :ALEGoToDefinition<cr>

    " let g:ale_completion_max_suggestions = 10
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_on_enter = 0
    let g:ale_lint_on_save = 1

    let g:airline#extensions#ale#enabled = 1
    let g:ale_linters = {
    \   'elixir': ['dialyxir', 'credo', 'mix'],
    \   'javascript': ['eslint'],
    \}
    let g:ale_fixers = {
    \   'javascript': ['eslint'],
    \   'elixir': ['mix_format'],
    \}
    let g:ale_fix_on_save = 0
    nmap <silent> ]e <Plug>(ale_next_wrap)



Plug 'lifepillar/vim-mucomplete'
  set shortmess+=c
  set completeopt-=preview
  set completeopt+=menuone,noselect
  let g:mucomplete#enable_auto_at_startup = 1
  let MUcompleteNotify = 1

  let g:mucomplete#chains = {
    \ 'default' : ['path', 'omni', 'keyp', 'dict', 'uspl', 'user', 'incl'],
    \ }

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Optional:
Plug'honza/vim-snippets'
  :imap <C-j> <Plug>snipMateNextOrTrigger
  :smap <C-j> <Plug>snipMateNextOrTrigger

Plug 'wellle/tmux-complete.vim'
Plug 'markonm/traces.vim'
Plug 'tommcdo/vim-lion'                              " gl and gL align around a character (so glip=)
Plug 'coderifous/textobj-word-column.vim'
Plug 'kana/vim-textobj-entire'
Plug 'michaeljsmith/vim-indent-object'               " use indent level like ii or ai
Plug 'machakann/vim-swap'                            " use g< and g> and gs to swap delimited things
Plug 'junegunn/vim-peekaboo'                         " peak at registers with \" and @ and <C-R>
Plug 'kshenoy/vim-signature'
Plug 'rbgrouleff/bclose.vim'                         " close buffer without closing windows
Plug 'majutsushi/tagbar'
  nmap <F8> :TagbarToggle<CR>
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'justinmk/vim-gtfo'                             " got and gof open current file in terminal/file manager
Plug 'romainl/vim-devdocs'                           " use :DD to look up keywords on devdocs.io
Plug 'dhruvasagar/vim-zoom'

Plug 'haya14busa/vim-signjk-motion'
  nnoremap <Leader>j <Plug>(signjk-j)
  nnoremap <Leader>k <Plug>(signjk-k)
  omap L <Plug>(textobj-signjk-lines)
  vmap L <Plug>(textobj-signjk-lines)
Plug 'unblevable/quick-scope'
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
Plug 'henrik/vim-indexed-search'
Plug 'romainl/vim-cool'
  let g:CoolTotalMatches = 1
Plug 'jeetsukumaran/vim-indentwise'                  " [+ [- to move to indents [% by block
Plug 'jiangmiao/auto-pairs'

Plug 'ternjs/tern_for_vim'
Plug 'othree/csscomplete.vim'
Plug 'ap/vim-css-color'                              " color css color codes
Plug 'alvan/vim-closetag'

Plug 'AndrewRadev/splitjoin.vim'                     " gS and gJ split and join functions/statements into single/multi line
Plug 'kana/vim-niceblock'                            " make A and I work for all visual modes
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
  let g:vim_markdown_frontmatter = 1  " for YAML format
  let g:vim_markdown_toml_frontmatter = 1  " for TOML format
  let g:vim_markdown_json_frontmatter = 1  " for JSON format
Plug 'tpope/vim-abolish'
Plug 'yuttie/comfortable-motion.vim'
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(10)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-10)<CR>
  let g:comfortable_motion_friction = 300.0
  let g:comfortable_motion_air_drag = 8.0
Plug 'jkramer/vim-checkbox'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }                          " distraction free vim
Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
  let g:limelight_conceal_ctermfg = 'gray'
  let g:limelight_conceal_guifg = 'DarkGray'
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
" Plug 'chrisbra/Colorizer'
" If you have nodejs and yarn

Plug '/usr/local/opt/fzf'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
  "let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
  nnoremap <leader>t :Files<CR>
"  nnoremap <leader>b :Buffers<CR>
  nnoremap <leader>c :Commits<CR>
  nnoremap <leader>f :Rg!<CR>

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

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Plug 'ludovicchabant/vim-gutentags'
  " g:gutentags_ctags_tagfile = '.git/tags'

Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'croaker/mustang-vim'
Plug 'arcticicestudio/nord-vim'
" Plug 'jeffkreeftmeijer/vim-dim'
" Plug 'noahfrederick/vim-noctu'
Plug 'rakr/vim-two-firewatch'
Plug 'beikome/cosme.vim'
Plug 'wolverian/minimal'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ }
call plug#end()


"}}}
"
" source $DOTFILES/vetc/airline_config.vim
let g:airline_theme='angr'
" source $DOTFILES/vetc/theme.vim
set notermguicolors
" set termguicolors
" colorscheme mustang
set background=dark
colorscheme noctu
set fillchars+=vert:│
" hi VertSplit ctermbg=NONE guibg=NONE
