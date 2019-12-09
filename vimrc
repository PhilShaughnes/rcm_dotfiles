"**************"
"** SETTINGS **"
"**************"
filetype plugin on        " filetype detection[ON] plugin[ON] indent[ON]
filetype indent on        " activates indenting for files
set number                " show line numbers
set encoding=utf-8
set laststatus=2          " last window always has a statusline
set hlsearch              " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set gdefault              " apply substitutions globally on lines
set ignorecase
set smartcase             " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
set linebreak
set breakindent           " indent wrapped text
set clipboard=unnamed     " use the system clipboard as default
set showcmd               " show command in bottom bar
set wildmenu              " visual autocomplete for command menu
set lazyredraw            " redraw ony when needed to
set mouse=a               " mouse will work
set autoread              " reload the file if it changed
set autowrite             " auto save when switching buffers
set hidden                " allow unsaved buffers when switching
set cursorcolumn
set splitbelow
set splitright
set nobackup
set noswapfile
set list listchars=tab:»\ ,trail:·,nbsp:· ",eol:¬ ,space:· " display extra white space

" use ripgrep to search
if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

augroup TermOpen
  autocmd!
  autocmd BufEnter term://* startinsert
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

augroup saving
  autocmd!
  autocmd WinEnter,BufWinEnter,FocusGained * checktime
  autocmd FocusLost * silent! wa
augroup end

augroup filetypes
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
augroup END

augroup quickfix
  autocmd!
  " automatic location/quickfix window
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost    l* lwindow
  autocmd VimEnter            * cwindow
augroup END


"************"
"** KEYMAP **"
"************"
" easier beginning and end of line
noremap H     ^
noremap L     $
" make marks more better (go to column instead of line)
noremap ' `
" Y goes to end of line
nnoremap Y y$
" Select your Leader key
let mapleader = "\<Space>"
" Enter cancels search highlighting
nnoremap <silent> <Leader><Space> :nohlsearch<CR>
" nnoremap , :nohlsearch<CR>

nnoremap <leader>/ :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader>% :%s/\<<C-r>=expand("<cword>")<CR>\>/
vnoremap <leader>/ y:%s/<C-r>"/

" find all occurances of a thing in all open/saved buffers
nnoremap <leader>s :cex []<CR> :silent bufdo grepadd '' % <S-Left><Left><Left>
nnoremap <leader>d :cex []<CR> :silent bufdo grepadd '<C-r><C-w>' %<CR>

" ]<Space> inserts new line below
nmap <leader>o m`o<Esc>``
" [<Space> inserts new line above
nmap <leader>O m`O<Esc>``
 " jj is escape
inoremap jj <C-\><C-n>

" inoremap <C-g><Space> <Esc>/<++><Enter>"_c4l
" Q runs default macro
nnoremap Q @q
vnoremap Q :norm @q<cr> @q
" visual up and down
nmap j gj
nmap k gk

" buffer switch
nnoremap <leader>bl :ls<CR>:b<space>
nnoremap <leader>bb :Buffers<CR>

nnoremap > >>
nnoremap < <<
vnoremap > >><Esc>gv
vnoremap < <<<Esc>gv


" vnoremap <leader>s "ry:call system('tmux send-keys -t .+ "echo <c-r>r" Enter')<CR>
" nmap <leader>m :call system('tmux send-keys -t .+ "

" <C-e/E> work like E but in insert mode
inoremap <C-e> <ESC>ea
" inoremap <C-t> <Esc>/[)}"'\]>]<CR>:nohl<CR>a
" inoremap <C-b> <Esc>?[({"'\[<]<CR>:nohl<CR>i

" highlight last inserted text
nnoremap gV `[v`]


" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" paste over highlighted text and retain copied text
vnoremap <leader>p "_dP
" paste last yanked text (not deleted)
nnoremap <leader>v "0p
" leader w is kill buffer
nnoremap <leader>w :bp\|sp\|bn\|bd <CR>

" buffer switch
nnoremap <leader>l :ls<CR>:b<space>
nnoremap <leader>p :bp<CR>
nnoremap <BS> :b#<CR>
nnoremap <leader>n :bn<CR>


" " ctrl j and k to move in quickfix windows
" nnoremap <silent> <C-j> :cn<CR>
" nnoremap <silent> <C-k> :cp<CR>

nnoremap <C-q> <C-w>w

inoremap <C-\> ✓✗

" side scroll
nnoremap <C-H> 5zh
nnoremap <C-L> 5zl

" terminal - jj goes to normal mode
tnoremap jj <C-\><C-n>
" terminal - go to normal mode
tnoremap <C-\> <C-\><C-n>

inoremap ,; <Esc>m`A;<Esc>``a
inoremap ,) <Esc>m`A)<Esc>``a
inoremap ,} <Esc>m`A}<Esc>``a
nnoremap <leader>; m`A;<Esc>``

" better completion menu
inoremap ,o <C-x><C-o>
inoremap ,u <C-x><C-u>
inoremap ,f <C-x><C-f>
inoremap ,l <C-x><C-l>
inoremap ,, <C-x><C-p>

inoremap <C-u> <C-x><C-u>
inoremap <C-v> <C-x><C-l>
inoremap <C-b> <C-x><C-o>
inoremap <C-f> <C-x><C-f>
inoremap <C-g> <C-x><C-p>

" expand things
inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O

" add to end of line
inoremap <C-t> <C-o>mm<C-o>A

"*************"
"*** PLUGS ***"
"*************"
call plug#begin('~/.local/share/nvim/plugged')       " install with :PlugInstall

Plug 'tpope/vim-sleuth'                              "auto detects and sets shiftwidth, expandtab, etc.
Plug 'tpope/vim-fugitive'
    nnoremap <leader>g :Gstatus<CR>
Plug 'tpope/vim-commentary'                          "comment stuff out with gc (gcc to do a line)
Plug 'tpope/vim-endwise'                             "auto add end to stuffs

Plug 'romainl/vim-qlist'
Plug 'romainl/vim-qf'
  nmap <C-j> <Plug>(qf_qf_next)
  nmap <C-k> <Plug>(qf_qf_previous)
  nmap <leader>k <Plug>(qf_loc_previous)
  nmap <leader>j <Plug>(qf_loc_next)
  nmap \|\| <Plug>(qf_loc_toggle)
  nmap \\ <Plug>(qf_qf_toggle)

Plug 'https://gitlab.com/hauleth/qfx.vim'

Plug 'machakann/vim-sandwich'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'

Plug 'terryma/vim-multiple-cursors'

" replace ALE with vim built-in makeprg - WIP
" Plug 'igemnace/vim-makery'
" Plug 'hauleth/asyncdo.vim'
Plug 'w0rp/ale'
    " let g:ale_elixir_elixir_ls_release = '/Users/phil/Documents/code/elixir/elixir-ls/rel'
    let g:ale_completion_enabled = 1
    autocmd FileType elixir nnoremap <c-]> :ALEGoToDefinition<cr>

    let g:ale_lint_on_text_changed = 'always'
    let g:ale_lint_on_enter = 0
    let g:ale_lint_on_save = 1

    let g:airline#extensions#ale#enabled = 0
    let g:ale_linters = {
    \   'javascript': ['eslint'],
    \}
    let g:ale_fixers = {
    \   'javascript': ['prettier', 'eslint'],
    \   'elixir': ['mix_format'],
    \}
    let g:ale_fix_on_save = 0
    let g:ale_javascript_prettier_use_local_config = 1
    nmap <silent> [e <Plug>(ale_previous_wrap)
    nmap <silent> ]e <Plug>(ale_next_wrap)

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'yami-beta/asyncomplete-omni.vim'
  autocmd User asynccomplete_setup call asyncomplete#register_source(
    \ asyncomplete#sources#omni#get_source_options({
      \ 'name': 'omni',
      \ 'whitelist': ['*'],
      \ 'blacklist': ['c', 'cpp', 'html'],
      \ 'completor': function('asyncomplete#sources#omni#completor')
      \  }))
  let g:tmuxcomplete#asyncomplete_source_options = {
    \ 'name':      'tmuxcomplete',
    \ 'whitelist': ['*'],
    \ 'config': {
    \     'splitmode':      'words',
    \     'filter_prefix':   1,
    \     'show_incomplete': 1,
    \     'sort_candidates': 0,
    \     'scrollback':      0,
    \     'truncate':        0
    \     }
    \ }
Plug 'keremc/asyncomplete-racer.vim'
  autocmd User asyncomplete_setup call asyncomplete#register_source(
    \ asyncomplete#sources#racer#get_source_options())

" Plug 'lifepillar/vim-mucomplete'
"   set shortmess+=c
"   set completeopt-=preview
"   set completeopt+=menuone,noselect
"   let g:mucomplete#enable_auto_at_startup = 1
"   " let g:mucomplete#completion_delay = 50
"   " let g:mucomplete#reopen_immediately = 0
"   let MUcompleteNotify = 1

"   imap <expr> <C-v> mucomplete#extend_fwd("\<C-v>")
"   let g:mucomplete#chains = {
"     \ 'default' : ['path', 'omni', 'keyp', 'incl', 'dict', 'uspl', 'user'],
"     \ }

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Optional:
Plug'honza/vim-snippets'
  " imap <C-g> <Plug>snipMateNextOrTrigger
  " smap <C-g> <Plug>snipMateNextOrTrigger
  " imap <C-f> <Plug>snipMateBack
  " smap <C-f> <Plug>snipMateBack

  " imap <expr><C-j> pumvisible() ? "\<plug>(MUcompleteCycFwd)" : "\<Plug>snipMateNextOrTrigger"
  " smap <expr><C-j> pumvisible() ? "\<plug>(MUcompleteCycFwd)" : "\<Plug>snipMateNextOrTrigger"
  " imap <expr><C-h> pumvisible() ? "\<plug>(MUcompleteCycBwd)" : "\<Plug>snipMateBack"
  " smap <expr><C-h> pumvisible() ? "\<plug>(MUcompleteCycBwd)" : "\<Plug>snipMateBack"


Plug 'wellle/tmux-complete.vim'
Plug 'markonm/traces.vim'
Plug 'tommcdo/vim-lion'                              " gl and gL align around a character (so glip=)
Plug 'kana/vim-textobj-entire'
Plug 'michaeljsmith/vim-indent-object'               " use indent level like ii or ai
Plug 'jeetsukumaran/vim-indentwise'
Plug 'machakann/vim-swap'                            " use g< and g> and gs to swap delimited things
Plug 'junegunn/vim-peekaboo'                         " peak at registers with \" and @ and <C-R>
Plug 'rbgrouleff/bclose.vim'                         " close buffer without closing windows
Plug 'majutsushi/tagbar'
  nmap <F8> :TagbarToggle<CR>
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'justinmk/vim-gtfo'                             " got and gof open current file in terminal/file manager
Plug 'romainl/vim-devdocs'                           " use :DD to look up keywords on devdocs.io
Plug 'dhruvasagar/vim-zoom'
Plug 'vimwiki/vimwiki'
  nmap <Leader>x <Plug>VimwikiToggleListItem
  vmap <Leader>x <Plug>VimwikiToggleListItem
  " let g:vimwiki_list = [{'path': '~/Documents/vimwiki', 'syntax': 'markdown'}]
  nmap <Leader><Backspace> <Plug>VimwikiGoBackLink
  nmap <Leader>= <Plug>VimwikiAddHeaderLevel
  nmap <Leader>- <Plug>VimwikiRemoveHeaderLevel
  " let g:vimwiki_listsyms = '✗○◐●✓'
  let g:vimwiki_listsyms = ' .oOx'
  " let g:vimwiki_folding = 'list'

Plug 'unblevable/quick-scope'
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
Plug 'romainl/vim-cool'
  let g:CoolTotalMatches = 1
" Plug 'jiangmiao/auto-pairs'
Plug 'PhilShaughnes/vim-closer'

Plug 'othree/csscomplete.vim'
Plug 'ap/vim-css-color'                              " color css color codes
Plug 'alvan/vim-closetag'

Plug 'vim-ruby/vim-ruby'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'elixir-editors/vim-elixir'
Plug 'rust-lang/rust.vim'
  let g:rustfmt_autosave = 1
Plug 'racer-rust/vim-racer'
  au FileType rust nmap gd <Plug>(rust-def)
  au FileType rust nmap gs <Plug>(rust-def-split)
  au FileType rust nmap gx <Plug>(rust-def-vertical)
  au FileType rust nmap <leader>gd <Plug>(rust-doc)

Plug 'AndrewRadev/splitjoin.vim'                     " gS and gJ split and join functions/statements into single/multi line
Plug 'kana/vim-niceblock'                            " make A and I work for all visual modes
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
  let g:polyglot_disabled = ['javascript', 'elixir', 'ruby']
  let g:vim_markdown_frontmatter = 1  " for YAML format
  let g:vim_markdown_toml_frontmatter = 1  " for TOML format
  let g:vim_markdown_json_frontmatter = 1  " for JSON format
Plug 'tpope/vim-abolish'
Plug 'yuttie/comfortable-motion.vim'
  noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(10)<CR>
  noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-10)<CR>
  let g:comfortable_motion_friction = 300.0
  let g:comfortable_motion_air_drag = 8.0
Plug 'junegunn/goyo.vim'                          " distraction free vim
Plug 'junegunn/limelight.vim'
  let g:limelight_conceal_ctermfg = 'gray'
  let g:limelight_conceal_guifg = 'DarkGray'
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!

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

call plug#end()


"*************"
"*** THEME ***"
"*************"

" let g:airline_theme='angr'
set notermguicolors
set background=dark
colorscheme noctu
set fillchars+=vert:│
" hi VertSplit ctermbg=NONE guibg=NONE
set statusline=%6*(%n)%{v:register}\ %f%m\ %8*%{FugitiveHead()}%=
set statusline+=%y\ %p%%\ %6*<>\ %8*%c:%l/%L\ 


