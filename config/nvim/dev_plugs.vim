"*************"
"*** PLUGS ***"
"*************"

call plug#begin('~/.local/share/nvim/plugged')          " install with :PlugInstall

  Plug '/usr/local/opt/fzf'
  Plug '~/.fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary'                          "comment stuff out with gc (gcc to do a line)
  Plug 'tpope/vim-fugitive'

  " this breaks vimwiki <CR> in insert mode a bit, but is mostly fine ;)
  Plug 'tmsvg/pear-tree'                               " auto close parens and stuff on enter
  Plug 'tweekmonster/startuptime.vim'

  Plug 'romainl/vim-cool'
  Plug 'junegunn/vim-peekaboo'                         " peak at registers with \" and @ and <C-R>
  Plug 'markonm/traces.vim'
  Plug 'machakann/vim-sandwich'
  Plug 'tpope/vim-endwise'                             "auto add end to stuffs
  Plug 'kana/vim-niceblock'                            " make A and I work for all visual modes
  " Plug 'airblade/vim-gitgutter'

  Plug 'romainl/vim-qlist'
  Plug 'romainl/vim-qf'

  Plug 'dhruvasagar/vim-zoom'
  Plug 'rbgrouleff/bclose.vim'                         " close buffer without closing windows
  Plug 'jeetsukumaran/vim-indentwise'
  Plug 'tommcdo/vim-lion'                              " gl and gL align around a character (so glip=)
  Plug 'michaeljsmith/vim-indent-object'               " use indent level like ii or ai
  Plug 'justinmk/vim-gtfo'                             " got and gof open current file in terminal/file manager
  " Plug 'romainl/vim-devdocs'                           " use :DD to look up keywords on devdocs.io
  Plug 'skywind3000/asyncrun.vim'

  Plug 'nvim-lua/plenary.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'justinmk/vim-dirvish'
  Plug 'neovim/nvim-lspconfig'
  Plug 'steelsojka/completion-buffers'
  Plug 'nvim-lua/completion-nvim'
  Plug 'sainnhe/sonokai'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'glepnir/indent-guides.nvim'

  Plug 'norcalli/snippets.nvim'

  Plug 'vimwiki/vimwiki'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-abolish'                             " lots of cool pattern stuff
  " Plug 'yuttie/comfortable-motion.vim'

" language specific

  Plug 'mtdl9/vim-log-highlighting'
  Plug 'othree/csscomplete.vim'
  Plug 'ap/vim-css-color'                              " color css color codes
  Plug 'alvan/vim-closetag'
  Plug 'mattn/emmet-vim'
  Plug 'moll/vim-node'
  Plug 'pangloss/vim-javascript'

  Plug 'vim-ruby/vim-ruby'
  Plug 'elixir-editors/vim-elixir'
  " Plug 'xolox/vim-lua-ftplugin'
  " Plug 'xolox/vim-misc'
  Plug 'fatih/vim-go'
  Plug 'mrk21/yaml-vim'
  " Plug 'rust-lang/rust.vim'
  " Plug 'racer-rust/vim-racer'
  Plug 'junegunn/goyo.vim'                             " distraction free vim
  Plug 'junegunn/limelight.vim'

  Plug 'crusoexia/vim-monokai'
  Plug 'bluz71/vim-moonfly-colors'
  " Plug 'bluz71/vim-moonfly-statusline'
  Plug 'hoob3rt/lualine.nvim'

call plug#end()

lua require('colorizer').setup()
lua require('gitsigns').setup()
lua << EOF
local lualine = require('lualine')
    lualine.theme = 'dracula'
    lualine.separator = '|'
    lualine.sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location'  },
    }
    lualine.inactive_sections = {
      lualine_a = { },
      lualine_b = { 'filename' },
      lualine_c = { },
      lualine_x = { },
      lualine_y = { 'location' },
      lualine_z = { },
    }
    lualine.extensions = { 'fzf' }
    lualine.status()
EOF
" let g:moonflyWithGitBranchCharacter = 1

" nvim-completion settings:
let g:completion_enable_auto_popup = 0
let g:completion_enable_auto_hover = 0
let g:completion_enable_auto_signature = 0
let g:completion_auto_change_source = 1
let g:completion_confirm_key = "\<C-y>"
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
imap <c-j> <Plug>(completion_next_source)
"use <c-j> to switch to previous completion
imap <c-k> <Plug>(completion_prev_source)
" use <c-k> to switch to next completion

" let g:completion_enable_snippet = 'snippets.nvim'
" \{'complete_items': ['lsp', 'snippet']},
let g:completion_chain_complete_list = [
    \{'mode': 'line'},
    \{'mode': 'keyp'},
    \{'mode': 'keyn'}
\]

" \{'complete_items': ['buffers']},
"<c-n>" : i_CTRL-N
"<c-p>" : i_CTRL-P
"cmd" : i_CTRL-X_CTRL-V
"defs": i_CTRL-X_CTRL-D
"dict": i_CTRL-X_CTRL-K
"file": i_CTRL-X_CTRL-F
"incl": i_CTRL-X_CTRL-I
"keyn": i_CTRL-X_CTRL-N
"keyp": i_CTRL-X_CTRL-P
"omni": i_CTRL-X_CTRL-O
"line": i_CTRL-X_CTRL-L
"spel": i_CTRL-X_s
"tags": i_CTRL-X_CTRL-]
"thes": i_CTRL-X_CTRL-T
"user": i_CTRL-X_CTRL-U

autocmd BufEnter * lua require'completion'.on_attach()


" lua-tree settings
nnoremap <C-n> :NvimTreeToggle<CR>

" vim-cool settings:
let g:CoolTotalMatches = 1

" fugitive:
nnoremap <leader>g :Gstatus<CR>

" Markdown
let g:limelight_conceal_ctermfg = 'Gray'
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

let wiki_nested = {'python': 'python', 'elixir': 'elixir', 'js': 'javascript'}
let wiki1 = {}
let wiki2 = {}
let wiki1.path = '~/vimwiki/'
let wiki2.path = '~/vimwki_md/'
let wiki1.syntax = 'default'
let wiki2.syntax = 'markdown'
let wiki1.ext = '.wiki'
let wiki2.ext = '.md'
let wiki1.nested_syntaxes = wiki_nested
let wiki2.nested_syntaxes = wiki_nested
let g:vimwiki_list = [wiki1]

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
nnoremap <silent> <leader>t :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>f :Rg!<CR>
nnoremap <leader>m :RG<CR>

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

  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Replace the default dictionary completion with fzf-based fuzzy completion
" inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

