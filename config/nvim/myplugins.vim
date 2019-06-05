if &compatible
  set nocompatible
endif

" run this to install packager the first time:
" git clone https://github.com/kristijanhusak/vim-packager ~/.config/nvim/pack/packager/opt/vim-packager

" Load packager only when you need it
function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })

  call packager#add('rakr/vim-two-firewatch', { 'type': 'opt' })

  call packager#add('kana/vim-textobj-user')
  call packager#add('kana/vim-textobj-line')
  call packager#add('kana/vim-textobj-function')
  call packager#add('kana/vim-textobj-entire')
  call packager#add('michaeljsmith/vim-indent-object')

  call packager#add('machakann/vim-sandwich')
  call packager#add('tpope/vim-endwise')
  call packager#add('markonm/traces.vim')

  call packager#add('sheerun/vim-polyglot')
  call packager#add('airblade/vim-gitgutter')
  call packager#add('tpope/vim-fugitive')
  call packager#add('tpope/vim-commentary')       "comment stuff out with gc (gcc to do a line)
  call packager#add('kana/vim-niceblock')         " make A and I work for all visual modes

  call packager#add('romainl/vim-cool')

  call packager#add('lifepillar/vim-mucomplete')

  call packager#local('/usr/local/opt/fzf')
  call packager#local('~/.fzf')
  call packager#add('junegunn/fzf.vim')

endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

"Load plugins only for specific filetype
augroup packager_filetype
  autocmd!
  " autocmd FileType javascript packadd vim-js-file-import
  " autocmd FileType go packadd vim-go
  " autocmd FileType php packadd phpactor
augroup END

" vim-cool settings:
let g:CoolTotalMatches = 1


" MUcomplete settings:

set shortmess+=c
set completeopt-=preview
set completeopt+=menuone,noselect
" let g:mucomplete#enable_auto_at_startup = 1
let MUcompleteNotify = 1

let g:mucomplete#chains = {
  \ 'default' : ['path', 'omni', 'keyp', 'dict', 'uspl', 'snip', 'user', 'incl'],
  \ }


" FZF settings:

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
