"*************"
"*** PLUGS ***"
"*************"

call plug#begin('~/.local/share/vim/plugged')       " install with :PlugInstall

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'altercation/vim-colors-solarized'

Plug 'tpope/vim-sleuth'                              "auto detects and sets shiftwidth, expandtab, etc.
Plug 'tpope/vim-fugitive'
    nnoremap <leader>g :Gstatus<CR>
Plug 'tpope/vim-commentary'                          "comment stuff out with gc (gcc to do a line)
Plug 'tpope/vim-endwise'                             "auto add end to stuffs
Plug 'kana/vim-niceblock'                            " make A and I work for all visual modes
Plug 'airblade/vim-gitgutter'

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

" Plug 'terryma/vim-multiple-cursors'

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
  let g:asyncomplete_auto_popup = 0
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ asyncomplete#force_refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
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
" Plug 'ervandew/supertab'

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

Plug 'tpope/vim-projectionist'

Plug 'othree/csscomplete.vim'
Plug 'ap/vim-css-color'                              " color css color codes
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
  let g:user_emmet_leader_key=','

Plug 'vim-ruby/vim-ruby'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'AndrewRadev/ember_tools.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go'
Plug 'rhysd/vim-crystal'
Plug 'rust-lang/rust.vim'
  let g:rustfmt_autosave = 1
Plug 'racer-rust/vim-racer'
  au FileType rust nmap gd <Plug>(rust-def)
  au FileType rust nmap gs <Plug>(rust-def-split)
  au FileType rust nmap gx <Plug>(rust-def-vertical)
  au FileType rust nmap <leader>gd <Plug>(rust-doc)

Plug 'AndrewRadev/splitjoin.vim'                     " gS and gJ split and join functions/statements into single/multi line
Plug 'sheerun/vim-polyglot'
  let g:polyglot_disabled = ['javascript', 'elixir', 'ruby', 'rust']
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
