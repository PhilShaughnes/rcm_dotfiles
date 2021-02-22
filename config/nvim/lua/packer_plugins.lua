local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local api = vim.api


local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


function _G.load_packer()
  cmd('packadd packer.nvim')
  local packer = require('packer')
  packer.compile('~/.config/nvim/packer_compiled.vim')
  return require('packer').startup(
    function()
      use {'wbthomason/packer.nvim', opt = true}

      use { 'junegunn/fzf.vim',
        requires = {'/usr/local/opt/fzf', opt = true},
      }
      use {'rstacruz/vim-closer'}
      use {'tpope/vim-commentary'}
      use {'tpope/vim-fugitive'}
      use {'romainl/vim-qf'}
      use {'romainl/vim-cool'}
      use {'junegunn/vim-peekaboo'}
      use {'markonm/traces.vim'}
      use {'machakann/vim-sandwich'}
      use {'tpope/vim-endwise'}
      use {'kana/vim-niceblock'}

      use {'dhruvasagar/vim-zoom'}
      use {'rbgrouleff/bclose.vim'}                         -- close buffer without closing windows
      use {'tommcdo/vim-lion'}                              -- gl and gL align around a character (so glip=)
      use {'justinmk/vim-gtfo'}                             -- got and gof open current file in terminal/file manager
      -- use {'jeetsukumaran/vim-indentwise'}
      -- use {'michaeljsmith/vim-indent-object'}               -- use indent level like ii or ai

      use {'ervandew/supertab'}

      use { 'kyazdani42/nvim-tree.lua'}
      use {'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim'
      }
      use {'glepnir/indent-guides.nvim'}
      use {'nvim-treesitter/nvim-treesitter'}
      use {'p00f/nvim-ts-rainbow'}
      -- use {'beauwilliams/focus.nvim'}

      use 'sainnhe/sonokai'
      use 'sainnhe/edge'
      use 'Th3Whit3Wolf/space-nvim'
      use { 'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
      }
    end
  )
end

local function gen_config()
  map('n', '<c-n>', ':NvimTreeToggle<CR>')
  map('n', '<leader>gg', ':Gstatus<CR>')
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

local function fzf_config()
  map('n', '<leader>t', ':Files<CR>')
  map('n', '<leader>b', ':Buffers<CR>')
  map('n', '<leader>f', ':Rg<CR>')
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

local function lualine_config()
  local l = require('lualine')
  -- l.theme = 'papercolor_dark'
  l.options.theme = 'codedark'
  -- l.theme = 'wombat'
  l.status()
end

load_packer()
gen_config()
fzf_config()
qf_config()
lualine_config()
treesitter_config()
print("loaded stuff")

local function do_thing()
end

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

