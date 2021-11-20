
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local api = vim.api
local paqpath = vim.fn.expand("$HOME/.local/share/nvim/paq-plugins/")

print "loading plugins..."

vim.opt.packpath:append(paqpath)
local paq = require "paq"
paq:setup({paqdir=paqpath})

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function load(name, config)
	if type(name) == "string" then name = {name} end
	-- if type(config) == "string" then config end

	paq.paq(name)
end

local function load_paq()
  -- cmd 'packadd paq-nvim'         -- Load package
  paq {

    {'savq/paq-nvim'};     -- Let Paq manage itself

    {'junegunn/fzf', run = fn['fzf#install']};
    {'junegunn/fzf.vim'};
    {'rstacruz/vim-closer'};
    {'tpope/vim-endwise'};
    {'tpope/vim-commentary'};
    {'tpope/vim-fugitive'};
    {'junegunn/gv.vim'};
    {'romainl/vim-qf'};
    {'romainl/vim-cool'};
    {'junegunn/vim-peekaboo'};
    {'markonm/traces.vim'};
    {'machakann/vim-sandwich'};
    {'kana/vim-niceblock'};


    {'rbgrouleff/bclose.vim'};                         -- close buffer without closing windows
    {'tommcdo/vim-lion'};                              -- gl and gL align around a character (so glip=)
    {'justinmk/vim-gtfo'};                             -- got and gof open current file in terminal/file manager
    -- {'jeetsukumaran/vim-indentwise'};
    {'michaeljsmith/vim-indent-object'};               -- use indent level like ii or ai
    -- {'tpope/vim-sleuth'};

    {'numtostr/FTerm.nvim'};

    {'nathom/filetype.nvim'};
		{'nvim-treesitter/nvim-treesitter'};
    {'p00f/nvim-ts-rainbow'};
    {'nvim-lua/plenary.nvim'};
    {'lewis6991/gitsigns.nvim'};
    -- {'luukvbaal/nnn.nvim'};
    {'mcchrish/nnn.vim'};

    {'tpope/vim-projectionist', opt=true};
    {'vimwiki/vimwiki'};
    {'folke/which-key.nvim'};
		{'L3MON4D3/LuaSnip'};

		{'neovim/nvim-lspconfig'};
		{'williamboman/nvim-lsp-installer'};
		{'ray-x/lsp_signature.nvim'};
		{'weilbith/nvim-code-action-menu'};
		{'hrsh7th/nvim-cmp'};
		{'hrsh7th/cmp-nvim-lsp'};
		{'hrsh7th/cmp-path'};
		{'hrsh7th/cmp-buffer'};
		{'hrsh7th/cmp-nvim-lua'};
		{'saadparwaiz1/cmp_luasnip'};


    {'mtdl9/vim-log-highlighting'};
    {'othree/csscomplete.vim'};
    {'norcalli/nvim-colorizer.lua'};
    {'alvan/vim-closetag'};
    {'mattn/emmet-vim'};
    {'moll/vim-node'};
    {'pangloss/vim-javascript'};

    {'vim-ruby/vim-ruby'};
    {'elixir-editors/vim-elixir'};
    -- {'xolox/vim-misc'};
    -- {'xolox/vim-lua-ftplugin'};
    {'cespare/vim-toml'};
    -- {'fatih/vim-go'};
    {'mrk21/yaml-vim'};
    {'junegunn/goyo.vim'};                             -- distraction free vim
    {'junegunn/limelight.vim'};

    {'kyazdani42/nvim-web-devicons'};
    {'sainnhe/sonokai'};
    {'sainnhe/edge'};
    {'folke/tokyonight.nvim'};
		-- { 'mcchrish/zenbones.nvim'};
		{'wuelnerdotexe/vim-enfocado'};
    {'nvim-lualine/lualine.nvim'};
  }
	-- paq.paq {'numtostr/FTerm.nvim'}
end

-- maybe do something like this??
local function def_cmd(name, func)
  cmd('command! call lua '..func)
end

local function gen_config()
  map('n', '<leader>gg', ':Gstatus<CR>')
  -- require('indent_guides').setup()
  require('colorizer').setup()
  g['tokyonight_style'] = 'night'
	-- g['enfocado_style'] = 'nature'
	g['enfocado_style'] = 'neon'

end

local function emmet_config()
  g['user_emmet_leader_key'] = ','
  g['user_emmet_settings'] = {
    javascript = { extends = "jsx" }
  }
end

local function ftterm_config()
  map('n', '<C-t>t', '<cmd>lua require("FTerm").toggle()<CR>')
  map('t', '<C-t>t', '<cmd>lua require("FTerm").toggle()<CR>')
  map('n', '<C-t>s', '<cmd>vsp term://bash')
  map('t', '<C-t>s', '<cmd>q<CR>')
end

-- local function nvim_nnn_config()
--   require('nnn').setup({
--     picker = {
--       style = { border = "rounded" },
--       session = "shared",
--     },
--     replace_netrw = "picker",
--     window_nav = "<C-l>"
--   })
--   map('n', '<leader>nm', '<cmd>NnnExplorer<CR>')
--   map('t', '<leader>nm', '<cmd>NnnExplorer<CR>')
--   map('n', '<leader>nn', '<cmd>NnnPicker<CR>')
--   map('t', '<leader>nn', '<cmd>NnnPicker<CR>')
-- end

local function vim_nnn_config()
  require('nnn').setup({
    set_default_mappings = 0,
    replace_netrw = 1,
    command = 'nnn -o',
    layout = {
      window = {
        width = 0.5,
        height = 0.7,
        highlight = 'debug'
      }
    }
  })
  map('n', '<leader>nn', ':call nnn#pick(getcwd())<CR>')
  map('n', '<leader>nm', ":call nnn#pick(expand('%:p:h'))<CR>")
  map('n', '<leader>nr', ":call nnn#pick(getcwd(), {'layout':{'left':'~20%'}})<CR>")
  map('n', '<leader>nl', ":call nnn#pick(expand('%:p:h'), {'layout':{'left':'~20%'}})<CR>")
end

local function vimwiki_config()
  -- local nested = {
  --   python = 'python',
  --   elixir = 'elixir',
  --   js = 'javascript',
  -- }

  g.vimwiki_list = {
    {
      path = '~/vimwiki',
      syntax = 'default',
      ext = '.wiki'
    },
    -- {
    --   path = '~/vimwiki_md',
    --   syntax = 'markdown',
    --   ext = '.md'
    -- }
  }

  map('n', '<leader>x', '<Plug>VimwikiToggleListItem', {noremap = false})
  map('v', '<leader>x', '<Plug>VimwikiToggleListItem', {noremap = false})
  map('n', '<leader><backspace>', '<Plug>VimwikiGoBackLink', {noremap = false})
  map('n', '<leader>=', '<Plug>VimwikiAddHeaderLevel', {noremap = false})
  map('n', '<leader>-', '<Plug>VimwikiRemoveHeaderLevel', {noremap = false})

end

local function fzf_config()
  map('n', '<leader>fb', ':Buffers<CR>')
  map('n', '<leader>ff', ':Files<CR>')
  map('n', '<leader>fc', ':Commits<CR>')
  map('n', '<leader>ft', ':Rg<CR>')
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
    -- ignore_install = {"elixir"},
    highlight = {
      enable = true,              -- false will disable the whole extension
      disable = { "c", "rust" },  -- list of language that will be disabled
    },
    -- rainbow = { enable = true }
    rainbow = { enable = false }
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
    -- indent = { enable = true },
  }

  -- cmd 'set foldmethod=expr'
  -- cmd 'set foldexpr=nvim_treesitter#foldexpr()'
  -- vim.wo.foldmethod = expr
  -- vim.wo.foldexpr = some function
end

local toggle_state = true
function _G.lsp_toggle()
	local toggled = not toggle_state
	toggle_state = toggled
	-- vim.diagnostic.config({virtual_text = toggled, underline = toggled})
	vim.diagnostic.config({virtual_text = toggled})
end

local function lsp_config()
	map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
	map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {silent = false})
	map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', {silent = false})
	map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', {silent = false})
	map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {silent = false})
	map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', {silent = false})
	map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
	map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
	map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
	map('n', '<leader>xv', '<cmd>lua lsp_toggle()<CR>')
end

local function lsp_action_config()
	map('n', '<leader>xa', ':CodeActionMenu<CR>', {silent = false})
end

function _G.lualine_config()
  require('lualine').setup({
    options = {
    -- icons_enabled = true,
    -- theme = 'auto',
    -- component_separators = {'', ''},
    -- section_separators = {'', ''},
    }
  })

end

load_paq()
gen_config()
fzf_config()
qf_config()
ftterm_config()
vim_nnn_config()
lualine_config()
gitsigns_config()
treesitter_config()
lsp_config()
lsp_action_config()
require 'config/cmp_config'
vimwiki_config()
print("loaded stuff")

local function do_thing(plugin, command)
    -- cmd 'command! ' .. command .. ' packadd ' .. plugin .. ' | :' .. command
		print("did the thing with" .. plugin .. " and " .. command)
end

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end
