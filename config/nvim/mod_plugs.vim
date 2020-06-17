"*************"
"*** PLUGS ***"
"*************"

call plug#begin('~/.local/share/vim/plugged')          " install with :PlugInstall

  Plug '/usr/local/opt/fzf'
  Plug '~/.fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary'                          "comment stuff out with gc (gcc to do a line)
  Plug 'tpope/vim-fugitive'

                                                       " auto close parens and stuff on enter
  Plug 'PhilShaughnes/vim-closer'

  Plug 'romainl/vim-cool'
  Plug 'junegunn/vim-peekaboo'                         " peak at registers with \" and @ and <C-R>
  Plug 'markonm/traces.vim'
  Plug 'machakann/vim-sandwich'
  Plug 'tpope/vim-endwise'                             "auto add end to stuffs
  Plug 'kana/vim-niceblock'                            " make A and I work for all visual modes
  Plug 'airblade/vim-gitgutter'

  Plug 'romainl/vim-qlist'
  Plug 'romainl/vim-qf'

  Plug 'dhruvasagar/vim-zoom'
  Plug 'rbgrouleff/bclose.vim'                         " close buffer without closing windows
  Plug 'jeetsukumaran/vim-indentwise'
  Plug 'tommcdo/vim-lion'                              " gl and gL align around a character (so glip=)
  Plug 'michaeljsmith/vim-indent-object'               " use indent level like ii or ai
  Plug 'justinmk/vim-gtfo'                             " got and gof open current file in terminal/file manager
  Plug 'romainl/vim-devdocs'                           " use :DD to look up keywords on devdocs.io
  Plug 'justinmk/vim-dirvish'
  Plug 'kristijanhusak/vim-dirvish-git'

  Plug 'vimwiki/vimwiki'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-abolish'                             " lots of cool pattern stuff
  Plug 'yuttie/comfortable-motion.vim'

" language specific
                                                       " Plug 'sheerun/vim-polyglot'
  Plug 'othree/csscomplete.vim'
  Plug 'ap/vim-css-color'                              " color css color codes
  Plug 'alvan/vim-closetag'
  Plug 'mattn/emmet-vim'
  Plug 'moll/vim-node'
  Plug 'pangloss/vim-javascript'

  Plug 'vim-ruby/vim-ruby'
  Plug 'elixir-editors/vim-elixir'
  Plug 'fatih/vim-go'
  Plug 'rhysd/vim-crystal'
  Plug 'rust-lang/rust.vim'
  Plug 'racer-rust/vim-racer'
  Plug 'junegunn/goyo.vim'                             " distraction free vim
  Plug 'junegunn/limelight.vim'

call plug#end()

" vim-cool settings:
let g:CoolTotalMatches = 1

" fugitive:
nnoremap <leader>g :Gstatus<CR>

" Markdown
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"rust/racer settings:
let g:rustfmt_autosave = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)


" vimwiki
nmap <Leader>x <Plug>VimwikiToggleListItem
vmap <Leader>x <Plug>VimwikiToggleListItem
" let g:vimwiki_list = [{'path': '~/Documents/vimwiki', 'syntax': 'markdown'}]
nmap <Leader><Backspace> <Plug>VimwikiGoBackLink
nmap <Leader>= <Plug>VimwikiAddHeaderLevel
nmap <Leader>- <Plug>VimwikiRemoveHeaderLevel
" let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_listsyms = ' .oOx'
" let g:vimwiki_folding = 'list'
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.syntax = 'default'
let wiki.ext = '.wiki'
let wiki.nested_syntaxes = {'python': 'python', 'elixir': 'elixir', 'js': 'javascript'}
let g:vimwiki_list = [wiki]

" Emmet
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" qf
nmap <C-k> <Plug>(qf_qf_previous)
nmap <C-j> <Plug>(qf_qf_next)
nmap <leader>k <Plug>(qf_loc_previous)
nmap <leader>j <Plug>(qf_loc_next)
nmap \|\| <Plug>(qf_loc_toggle)
nmap \\ <Plug>(qf_qf_toggle)

" FZF settings:
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


