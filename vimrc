" {{{ SETTINGS
set nocompatible          " for regular vim - turn of vi compatibility
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
   au FocusGained * checktime
   " check for and load file changes
autocmd WinEnter,BufWinEnter,FocusGained * checktime
set autowrite             " auto save when switching buffers
set hidden                " allow unsaved buffers when switching
" set colorcolumn=100
" save ov focus lost
:au FocusLost * silent! wa

set linespace=5
set title
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
"set guicursor=n-v-c:Hor20-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
" disable swapfile to avoid errors on load
set noswapfile
set nobackup

set list listchars=tab:»\ ,trail:·,nbsp:· ",eol:¬ ,space:· " display extra white space
let g:jsx_ext_required = 0

" use ripgrep to search
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
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
nnoremap \ :set hls!<CR>
" nnoremap , :nohlsearch<CR>
" ]<Space> inserts new line below
nmap <leader>o m`o<Esc>``
" [<Space> inserts new line above
nmap <leader>O m`O<Esc>``
 " jj is escape
inoremap jj <C-\><C-n>
" inoremap <C-i> <C-\><C-n>
" Q runs default macro
nnoremap Q @q
" visual up and down
nmap j gj
nmap k gk

" Tab and S-Tab indent in normal and visual mode
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv


vnoremap <leader>s "ry:call system('tmux send-keys -t .+ "echo <c-r>r" Enter')<CR>
nmap <leader>m :call system('tmux send-keys -t .+ "

" highlight last inserted text
nnoremap gV `[v`]

" leader k to hook into documentation lookup (we will remap K below)
noremap <leader>d K
" H/L to go to beggining/end of line
" J/K to go to above/below white space (paragraph)
noremap K     {
noremap J     }
noremap H     ^
noremap L     $

" paste over highlighted text and retain copied text
vnoremap <leader>p "_dP
" paste last yanked text (not deleted)
nnoremap <leader>v "0p
" leader w is kill buffer
nnoremap <leader>w :bp\|sp\|bn\|bd <CR>
nnoremap <leader>s :w <CR>
" leader q is quit (save?) - ZZ does this?
" use ctrl motions to navigate in insert mode
" inoremap <C-h> <left>
" inoremap <C-l> <right>
" inoremap <C-j> <down>
" inoremap <C-k> <up>
" nnoremap <ESC> i

" tab (next) and shift-tab (prev) to cycle buffer
map <leader><Tab> :bn<CR>
map <leader><S-Tab> :bp<CR>

" ctrl j and k to move in quickfix windows
map <C-j> :cn<CR>
map <C-k> :cp<CR>

" SPLITS
set splitbelow
set splitright
nnoremap <bs> <C-W>w

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

imap <C-\> ✓✗

" side scroll
nnoremap <C-H> 5zh
nnoremap <C-L> 5zl
nnoremap <C-h> ^
nnoremap <C-l> $


"}}}

" {{{ PLUGINS

call plug#begin('~/.local/share/nvim/plugged')       " install with :PlugInstall
" Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-sleuth'                              "auto detects and sets shiftwidth, expandtab, etc.
Plug 'tpope/vim-fugitive'
    nnoremap <leader>g :Gstatus<CR>
Plug 'tpope/vim-eunuch'                              "adds unix cmds like :Delete, :Mkdir, :Move, :Rename, :Unlink
Plug 'tpope/vim-commentary'                          "comment stuff out with gc (gcc to do a line)
Plug 'tpope/vim-endwise'                             "auto add end to stuffs
Plug 'tpope/vim-repeat'

Plug 'machakann/vim-sandwich'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'

" Plug 'ervandew/supertab'                             " use tab for completion
Plug 'terryma/vim-multiple-cursors'
" Plug 'slashmili/alchemist.vim'
let g:ale_elixir_elixir_ls_release = '/Users/phil/Documents/codes/elixir/elixir-ls/rel'
let g:ale_completion_enabled = 1
Plug 'w0rp/ale'
    let g:ale_elixir_elixir_ls_release = '/Users/phil/Documents/code/elixir/elixir-ls/rel'
    autocmd FileType elixir nnoremap <c-]> :ALEGoToDefinition<cr>

    let g:ale_completion_max_suggestions = 10
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_on_enter = 0
    let g:ale_lint_on_save = 1

    let g:airline#extensions#ale#enabled = 1
    let g:ale_linters = {
    \   'elixir': ['dialyxir', 'credo'],
    \   'javascript': ['eslint'],
    \}
    let g:ale_fixers = {
    \   'javascript': ['eslint'],
    \   'elixir': ['mix_format'],
    \}
    let g:ale_fix_on_save = 0
    nmap <silent> ]e <Plug>(ale_next_wrap)


" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
"
" let g:LanguageClient_serverCommands = {
"     \ 'elixir': ['/Users/phil/Documents/codes/elixir/elixir-ls/rel/language_server.sh'],
"     \ }
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'

"  " enable ncm2 for all buffers
"  autocmd BufEnter * :call ncm2#enable_for_buffer()
"  " let g:call ncm2#popup_limit 3

"  " Use <TAB> to select the popup menu:
"  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"  " IMPORTANTE: :help Ncm2PopupOpen for more information
"  set completeopt=noinsert,menuone,noselect

" Plug 'ncm2/ncm2-match-highlight'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-tmux'
" Plug 'ncm2/ncm2-path'

Plug 'lifepillar/vim-mucomplete'
  set shortmess+=c
  set completeopt-=preview
  set completeopt+=menuone,noselect
  let g:mucomplete#enable_auto_at_startup = 1

Plug 'matze/vim-move'                                " A-j and A-k move the selection up and down

Plug 'gcmt/wildfire.vim'                             " use enter to highlight next surrounding textobj
Plug 'tommcdo/vim-lion'                              " gl and gL align around a character (so glip=)
Plug 'coderifous/textobj-word-column.vim'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'michaeljsmith/vim-indent-object'               " use indent level like ii or ai
Plug 'machakann/vim-swap'                            " use g< and g> and gs to swap delimited things
Plug 'junegunn/vim-peekaboo'                         " peak at registers with \" and @ and <C-R>
Plug 'kshenoy/vim-signature'
Plug 'rbgrouleff/bclose.vim'                         " close buffer without closing windows
" Plug 'craigemery/vim-autotag'                        " need to have run
Plug 'majutsushi/tagbar'
  nmap <F8> :TagbarToggle<CR>
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on' : 'NERDTreeToggle' }
  noremap <leader>n :NERDTreeToggle<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  let NERDTreeQuitOnOpen = 1
  let NERDTreeAutoDeleteBuffer = 1
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
Plug 'vimwiki/vimwiki'

Plug 'haya14busa/vim-signjk-motion'
  map <Leader>j <Plug>(signjk-j)
  map <Leader>k <Plug>(signjk-k)
  omap L <Plug>(textobj-signjk-lines)
  vmap L <Plug>(textobj-signjk-lines)
Plug 'unblevable/quick-scope'
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
Plug 'romainl/vim-cool'
  let g:CoolTotalMatches = 1
Plug 'jeetsukumaran/vim-indentwise'                  " [+ [- to move to indents [% by block
Plug 'ap/vim-css-color'                              " color css color codes
"Plug 'clojure-vim/nvim-parinfer.js'
Plug 'jiangmiao/auto-pairs'
Plug 'wellle/targets.vim'                            " add pairs, separators, argument, block, quote
                                                     " next (n) and last (l)
Plug 'kana/vim-niceblock'                            " make A and I work for all visual modes
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'mileszs/ack.vim'
" Plug 'oblitum/rainbow'
"  let g:rainbow_active = 1
Plug 'yuttie/comfortable-motion.vim'
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(10)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-10)<CR>
  let g:comfortable_motion_friction = 300.0
  let g:comfortable_motion_air_drag = 8.0
Plug 'junegunn/goyo.vim'                          " distraction free vim
Plug 'junegunn/limelight.vim'
" Plug 'chrisbra/Colorizer'

Plug '/usr/local/opt/fzf'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
  "let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
  nnoremap <leader>t :Files<CR>
  nnoremap <leader>b :Buffers<CR>
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

" Plug 'liuchengxu/vim-which-key'
"   let g:mapleader = "\<Space>"
"   let g:maplocalleader = ','
"   nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
"   nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" Plug 'jelera/vim-javascript-syntax'
" Plug 'joukevandermaas/vim-ember-hbs'
" post install (yarn install | npm install) then load plugin only for editing supported files
" Plug 'prettier/vim-prettier', {
"   \ 'for': ['javascript', 'javascript.jsx', 'typescript', 'json', 'graphql'] }
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.json,*.graphql, PrettierAsync

Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'croaker/mustang-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'rakr/vim-two-firewatch'
Plug 'beikome/cosme.vim'
Plug 'yorickpeterse/happy_hacking.vim'
Plug 'jacoborus/tender.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"}}}
"

source ~/dotfiles/nvim/airline_config.vim
" source ~/dotfiles/nvim/theme.vim
colorscheme dim
set notermguicolors
" set termguicolors
" colorscheme two-firewatch
set background=dark
" colorscheme happy_hacking

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

