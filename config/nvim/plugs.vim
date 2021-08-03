"*************"
"*** PLUGS ***"
"*************"

call plug#begin('~/.local/share/nvim/plugged')         " install with :PlugInstall

  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary'                          "comment stuff out with gc (gcc to do a line)
  Plug 'tpope/vim-fugitive'
  " Plug 'cohama/lexima.vim'
  " Plug 'jiangmiao/auto-pairs'
  " Plug 'windwp/nvim-autopairs'
  Plug 'rstacruz/vim-closer'
  Plug 'tpope/vim-endwise'
  Plug 'romainl/vim-cool'
  Plug 'junegunn/vim-peekaboo'                         " peak at registers with \" and @ and <C-R>>
  Plug 'markonm/traces.vim'
  Plug 'machakann/vim-sandwich'
  Plug 'kana/vim-niceblock'                            " make A and I work for all visual modes

  " Plug 'airblade/vim-gitgutter'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'romainl/vim-qlist'
  Plug 'romainl/vim-qf'

  Plug 'numtostr/FTerm.nvim'
    nnoremap <C-t>t <cmd>lua require('FTerm').toggle()<CR>
    tnoremap <C-t>t <cmd>lua require('FTerm').toggle()<CR>
    nnoremap <C-t>s <cmd>vsp term://bash<CR>
    tnoremap <C-t>s <cmd>q<CR>

  Plug 'rbgrouleff/bclose.vim'                         " close buffer without closing windows
  Plug 'tommcdo/vim-lion'                              " gl and gL align around a character (so glip=)
  Plug 'justinmk/vim-gtfo'                             " got and gof open current file in terminal/file manager
  " Plug 'justinmk/vim-dirvish'
  " Plug 'kristijanhusak/vim-dirvish-git'
  Plug 'mcchrish/nnn.vim'
    let g:nnn#set_default_mappings = 0
    let g:nnn#layout = { 'window': { 'width': 0.5, 'height': 0.7, 'highlight': 'Debug' } }
    let g:nnn#command = 'nnn -e'
    let g:nnn#replace_netrw = 1
    let g:nnn#session = 'local'
    nnoremap - :call nnn#pick(expand('%:p:h'), { 'layout': 'enew' })<CR>
    nnoremap <leader>nw :call nnn#pick(getcwd(), { 'layout': 'enew' })<CR>
    nnoremap <leader>nr :call nnn#pick(getcwd(), { 'layout': {'left': '~20%'} })<CR>
    nnoremap <leader>nl :call nnn#pick(expand('%:p:h'), { 'layout': {'left': '~20%'} })<CR>
    nnoremap <leader>nm :call nnn#pick(expand('%:p:h'))<CR>
    nnoremap <leader>nn :call nnn#pick(getcwd())<CR>

  Plug 'ervandew/supertab'

  Plug 'vimwiki/vimwiki'
  Plug 'tpope/vim-projectionist'
  Plug 'terryma/vim-smooth-scroll'
    noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 5, 2)<CR>
    noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 5, 2)<CR>
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

  " Plug 'rhysd/clever-f.vim'
  "   let g:clever_f_mark_direct = 1
  " Plug 'kyazdani42/nvim-tree.lua', { 'on': 'NvimTreeToggle' }
  " Plug 'mbbill/undotree'
  Plug 'ojroques/vim-oscyank'
    vnoremap <leader>c :OSCYank<CR>
  Plug 'ThePrimeagen/vim-be-good'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'ggandor/lightspeed.nvim'
    map f <Plug>Lightspeed_s
    map F <Plug>Lightspeed_S

" language specific

  Plug 'mtdl9/vim-log-highlighting'
  Plug 'othree/csscomplete.vim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'alvan/vim-closetag'
  Plug 'mattn/emmet-vim'
  Plug 'moll/vim-node'
  Plug 'pangloss/vim-javascript'

  Plug 'vim-ruby/vim-ruby'
  Plug 'elixir-editors/vim-elixir'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-lua-ftplugin'
  Plug 'cespare/vim-toml'
  Plug 'fatih/vim-go'
  Plug 'mrk21/yaml-vim'
  Plug 'rhysd/vim-crystal'
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }           " distraction free vim
  Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }

  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'folke/tokyonight.nvim'
    let g:tokyonight_style = 'night'
    " let g:tokyonight_style = 'storm'
  Plug 'sainnhe/sonokai'
  Plug 'sainnhe/edge'
  Plug 'sainnhe/gruvbox-material'
  Plug 'crusoexia/vim-monokai'
  Plug 'hoob3rt/lualine.nvim'

call plug#end()

lua << EOF
require'colorizer'.setup()
-- require('nvim-autopairs').setup()

require('FTerm').setup()
local term = require('FTerm.terminal')
local nnn = term:new():setup({
  cmd = "nnn"
})

-- this isn't working ¯\_(ツ)_/¯
function _G.__fterm_nnn()
  nnn:toggle()
end


function lualine_config()
  require('lualine').setup({
    options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = {'', ''},
    section_separators = {'', ''},
    }
  })
end

lualine_config()

local function gitsigns_config()
    require('gitsigns').setup({
    signs = {
      add          = {hl = 'GitGutterAdd'   },
      change       = {hl = 'GitGutterChange'},
      delete       = {hl = 'GitGutterDelete'},
      topdelete    = {hl = 'GitGutterDelete'},
      changedelete = {hl = 'GitGutterChange'},
    }
  })
end

gitsigns_config()

local function treesitter_config()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
      disable = { "c", "fish"},  -- list of language that will be disabled
    },
    -- rainbow = { enable = true }
    rainbow = { enable = false },
    -- incremental_selection = {
    --   enable = true,
    --   keymaps = {
    --     init_selection = "gnn",
    --     node_incremental = "grn",
    --     scope_incremental = "grc",
    --     node_decremental = "grm",
    --   },
    -- },
    -- rainbow = { enable = true },
    indent = { enable = true },
  }

  -- cmd 'set foldmethod=expr'
  -- cmd 'set foldexpr=nvim_treesitter#foldexpr()'
  -- vim.wo.foldmethod = expr
  -- vim.wo.foldexpr = 
end

treesitter_config()

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end
EOF

" vim-cool settings:
let g:CoolTotalMatches = 1

" fugitive:
nnoremap <leader>gg :Gstatus<CR>

" Markdown
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'

autocmd! user goyoenter Limelight
autocmd! user goyoleave limelight!

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
nnoremap <leader>ff :Files<CR>
" nnoremap <leader>t :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>ft :Rg<CR>
" nnoremap <leader>m :RG<CR>

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
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

" Replace the default dictionary completion with fzf-based fuzzy completion
" inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
imap <c-x><c-l> <plug>(fzf-complete-line)

