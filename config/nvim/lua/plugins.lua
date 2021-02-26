
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local api = vim.api

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- add function(s) to lazy load on file/command, etc.

local function load_paq()
  cmd 'packadd paq-nvim'         -- Load package
  local paq = require'paq-nvim'.paq  -- Import module and bind `paq` function

  paq {'savq/paq-nvim', opt=true}     -- Let Paq manage itself

  paq {'junegunn/fzf', hook = fn['fzf#install']}
  paq {'junegunn/fzf.vim'}
  paq {'rstacruz/vim-closer'}
  paq {'tpope/vim-commentary'}
  paq {'tpope/vim-fugitive'}
  paq {'romainl/vim-qf'}
  paq {'romainl/vim-cool'}
  paq {'junegunn/vim-peekaboo'}
  paq {'markonm/traces.vim'}
  paq {'machakann/vim-sandwich'}
  paq {'tpope/vim-endwise'}
  paq {'kana/vim-niceblock'}

  paq {'dhruvasagar/vim-zoom'}
  paq {'rbgrouleff/bclose.vim'}                         -- close buffer without closing windows
  paq {'tommcdo/vim-lion'}                              -- gl and gL align around a character (so glip=)
  paq {'justinmk/vim-gtfo'}                             -- got and gof open current file in terminal/file manager
  -- paq {'jeetsukumaran/vim-indentwise'}
  -- paq {'michaeljsmith/vim-indent-object'}               -- use indent level like ii or ai

  paq {'ervandew/supertab'}

  paq { 'kyazdani42/nvim-tree.lua'}
  paq {'glepnir/indent-guides.nvim'}
  paq {'nvim-treesitter/nvim-treesitter'}
  paq {'p00f/nvim-ts-rainbow'}
  paq {'nvim-lua/plenary.nvim'}
  paq {'lewis6991/gitsigns.nvim'}

  paq {'justinmk/vim-dirvish', opt=true}
  paq {'tpope/vim-projectionist', opt=true}
  -- paq {'vimwiki/vimwiki'}

  paq {'mtdl9/vim-log-highlighting', opt=true}
  paq {'othree/csscomplete.vim'}
  paq {'ap/vim-css-color'}                              -- color css color codes
  paq {'alvan/vim-closetag'}
  paq {'mattn/emmet-vim'}
  paq {'moll/vim-node'}
  paq {'pangloss/vim-javascript'}

  paq {'vim-ruby/vim-ruby'}
  paq {'elixir-editors/vim-elixir'}
  paq {'xolox/vim-lua-ftplugin'}
  paq {'xolox/vim-misc'}
  paq {'cespare/vim-toml'}
  paq {'fatih/vim-go'}
  paq {'mrk21/yaml-vim'}
  paq {'junegunn/goyo.vim'}                             -- distraction free vim
  paq {'junegunn/limelight.vim'}

  paq {'kyazdani42/nvim-web-devicons'}
  paq {'sainnhe/sonokai'}
  paq {'sainnhe/edge'}
  paq {'Th3Whit3Wolf/space-nvim'}
  paq {'crusoexia/vim-monokai'}
  paq {'hoob3rt/lualine.nvim'}
end

-- maybe do something like this??
local function def_cmd(name, func)
  cmd('command! call lua '..func)
end

local function gen_config()
  map('n', '<c-n>', ':NvimTreeToggle<CR>')
  map('n', '<leader>gg', ':Gstatus<CR>')
  require('indent_guides').setup()
end

local function fzf_config()
  map('n', '<leader>t', ':Files<CR>')
  map('n', '<leader>bb', ':Buffers<CR>')
  map('n', '<leader>ff', ':Rg<CR>')
  map('n', '<leader>fw', ':Rg <C-r>=expand("<cword>")<CR><CR>')
  map('v', '<leader>fw', 'y:Rg <C-r>"<CR>')
  map('v', '<leader>gf', 'y:Files <C-r>"<CR>')
  map('n', '<leader>gf', ':Files <C-r>=expand("<cfile>")<CR><CR>')
  map('i', '<c-x><c-k>', 'fzf#vim#complete#word({\'window\': { \'width\': 0.2, \'height\': 0.9, \'xoffset\': 1 }})', {expr = true})
end

local function qf_config()
  map('n', '<C-k>', '<Plug>(qf_qf_previous)', {noremap = false})
  map('n', '<C-j>', '<Plug>(qf_qf_next)', {noremap = false})
  map('n', '<leader>k', '<Plug>(qf_loc_previous)', {noremap = false})
  map('n', '<leader>j', '<Plug>(qf_loc_next)', {noremap = false})
  map('n', '\\|\\|', '<Plug>(qf_loc_toggle)', {noremap = false})
  map('n', '\\\\', '<Plug>(qf_qf_toggle)', {noremap = false})
end

local function gitsigns_config()
    require('gitsigns').setup({
    signs = {
      -- add          = {hl = 'GitGutterAdd'   , text = '+'},
      -- change       = {hl = 'GitGutterChange', text = '~'},
      -- delete       = {hl = 'GitGutterDelete', text = '_'},
      -- topdelete    = {hl = 'GitGutterDelete', text = '‾'},
      -- changedelete = {hl = 'GitGutterChange', text = '~'},
      add          = {hl = 'GitGutterAdd'   },
      change       = {hl = 'GitGutterChange'},
      delete       = {hl = 'GitGutterDelete'},
      topdelete    = {hl = 'GitGutterDelete'},
      changedelete = {hl = 'GitGutterChange'},
    }
  })
end

local function treesitter_config()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
      disable = { "c", "rust" },  -- list of language that will be disabled
    },
    rainbow = { enable = true }
  }
end

function _G.lualine_config()
  local l = require('lualine')
  l.options = {
    icons_enabled = true,
    theme = 'codedark',
    component_separators = {'', ''},
    -- section_separators = {'', ''},
  }
  l.status()
end

load_paq()
gen_config()
fzf_config()
qf_config()
lualine_config()
gitsigns_config()
treesitter_config()
print("loaded stuff")

local function do_thing()
end

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end
