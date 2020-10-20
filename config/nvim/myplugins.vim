" run this to install packager the first time:
" git clone https://github.com/kristijanhusak/vim-packager ~/.config/nvim/pack/packager/opt/vim-packager

" Load packager only when you need it
function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })

  call packager#add('rakr/vim-two-firewatch', { 'type': 'opt' })
  call packager#add('owickstrom/vim-colors-paramount', { 'type': 'opt' })
  call packager#add('dracula/vim')

  call packager#add('junegunn/fzf.vim')
  call packager#local('/usr/local/opt/fzf')

  call packager#add('machakann/vim-sandwich')
  call packager#add('tpope/vim-endwise')
  call packager#add('PhilShaughnes/vim-closer')
  call packager#add('markonm/traces.vim')

  call packager#add('justinmk/vim-dirvish')
  call packager#add('kristijanhusak/vim-dirvish-git')
  call packager#add('justinmk/vim-gtfo')                                 " got and gof open current file in terminal/file manager

  call packager#add('airblade/vim-gitgutter')
  call packager#add('tpope/vim-fugitive')
  call packager#add('tpope/vim-commentary')                              "comment stuff out with gc (gcc to do a line)
  call packager#add('kana/vim-niceblock')                                " make A and I work for all visual modes
  call packager#add('dhruvasagar/vim-zoom')                              " <C-w>m zooms window. already autoloading

  call packager#add('romainl/vim-cool')
  call packager#add('romainl/vim-qlist')
  call packager#add('romainl/vim-qf')
  " doesn't seem to work as opt
  call packager#add('junegunn/vim-peekaboo')          " peak at registers with \" and @ and <C-R>


  call packager#add('tpope/vim-sleuth')               " auto detects and sets shiftwidth, expandtab, etc.
  call packager#add('rbgrouleff/bclose.vim')          " close buffer without closing window
  call packager#add('romainl/vim-devdocs')            " use :DD to look up keywords on devdocs.io
  call packager#add('tommcdo/vim-lion')               " gl and gL align around a character (so glip=)
  call packager#add('kana/vim-textobj-user')
  call packager#add('kana/vim-textobj-line')
  call packager#add('kana/vim-textobj-entire')
  call packager#add('michaeljsmith/vim-indent-object')

  call packager#add('vimwiki/vimwiki')
  call packager#add('yuttie/comfortable-motion.vim')

  "completion
  call packager#add('ervandew/supertab')

  "linting

  " file specific
  call packager#add('junegunn/goyo.vim', { 'type': 'opt' })
  call packager#add('junegunn/limelight.vim', { 'type': 'opt' })
  call packager#add('elixir-editors/vim-elixir')
  call packager#add('pangloss/vim-javascript')
  call packager#add('leafgarland/typescript-vim')
  call packager#add('moll/vim-node')
  call packager#add('vim-ruby/vim-ruby', { 'type': 'opt' })
  call packager#add('rust-lang/rust.vim', { 'type': 'opt' })
  call packager#add('racer-rust/vim-racer', { 'type': 'opt' })
  call packager#add('fatih/vim-go', { 'type': 'opt' })
  call packager#add('rhysd/vim-crystal')
  call packager#add('mattn/emmet-vim', { 'type': 'opt' })
  call packager#add('othree/csscomplete.vim')
  call packager#add('ap/vim-css-color')
  call packager#add('alvan/vim-closetag')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

command! SuperTab packadd supertab
command! Polyglot packadd vim-polyglot
command! VimWiki packadd vimwiki :VimwikiIndex
command! Emm packadd emmet-vim

"Load plugins only for specific filetype
augroup packager_filetype
  autocmd!
  " doing this b/c auto-starting it can cause conflicts if we use a different
  " autocmd FileType php packadd phpactor
  " autocmd FileType elixir,exs,ex packadd vim-elixir
  " autocmd FileType crystal packadd vim-crystal
  autocmd FileType ruby packadd vim-ruby
  autocmd FileType javascript packadd vim-javascript,vim-node
  autocmd FileType html,javascript,jsx packadd emmet-vim

  autocmd FileType go packadd vim-go
    au FileType go nmap <leader>m  <Plug>(go-build)
    au FileType go nmap <leader>r  <Plug>(go-run)
  autocmd FileType rust packadd rust.vim
  autocmd FileType rust packadd vim-racer
    au FileType rust nmap gd <Plug>(rust-def)
    au FileType rust nmap gs <Plug>(rust-def-split)
    au FileType rust nmap gx <Plug>(rust-def-vertical)
    au FileType rust nmap <leader>gd <Plug>(rust-doc)
  " autocmd FileType markdown,vimwiki packadd goyo.vim
  " autocmd FileType markdown,vimwiki packadd limelight.vim
  autocmd FileType markdown,vimwiki packadd vimwiki.vim,goyo.vim,limelight.vim
  " autocmd FileType vimwiki packadd goyo.vim
  " autocmd FileType vimwiki packadd limelight.vim
  " autocmd FileType vimwiki packadd vimwiki.vim
augroup END

" vim-cool settings:
let g:CoolTotalMatches = 1

" fugitive:
nnoremap <leader>g :Gstatus<CR>

" Markdown
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

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
let wiki_1 = {}
let wiki_1.path = '~/vimwiki/'
let wiki_1.syntax = 'default'
let wiki_1.ext = '.wiki'
let wiki_1.nested_syntaxes = {'python': 'python', 'elixir': 'elixir', 'js': 'javascript'}

let wiki_2 = {}
let wiki_2.path = '~/vimwiki_md/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'
let wiki_2.nested_syntaxes = {'python': 'python', 'elixir': 'elixir', 'js': 'javascript'}


let g:vimwiki_list = [wiki_1, wiki_2]

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

"let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
"
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

"Polyglot
let g:polyglot_disabled = ['javascript']
