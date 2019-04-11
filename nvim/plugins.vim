call plug#begin('~/.vim/plugged')

  Plug 'jeffkreeftmeijer/vim-dim'
  Plug 'rakr/vim-two-firewatch'

  Plug 'sheerun/vim-polyglot'
  Plug 'machakann/vim-sandwich'
  Plug 'kana/vim-niceblock'                            " make A and I work for all visual modes
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-textobj-function'
  Plug 'kana/vim-textobj-entire'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'wellle/targets.vim'

  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'                          "comment stuff out with gc (gcc to do a line)

  Plug 'romainl/vim-cool'
    let g:CoolTotalMatches = 1

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

call plug#end()


