local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local map = require('helpers').map
local paqpath = vim.fn.expand("$HOME/.local/share/nvim/paq-plugins/")

vim.opt.packpath:append(paqpath)
local paq = require "paq"
paq:setup({paqdir=paqpath})

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
    rainbow = { enable = true }
    -- rainbow = { enable = false }
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

local function cmpz_config()
	require 'config/cmp_config'
end

local plugins = {}
local function plug(plugin)
	plugin[#plugin+1] = plugin
end

	plug {'savq/paq-nvim'}     -- Let Paq manage itself

	plug {'junegunn/fzf', run = fn['fzf#install']}
	plug {'junegunn/fzf.vim'}
	fzf_config()

	plug {'rstacruz/vim-closer'}
	plug {'tpope/vim-endwise'}
	plug {'tpope/vim-commentary'}
	plug {'tpope/vim-fugitive'}
	gen_config()

	plug {'junegunn/gv.vim'}
	plug {'romainl/vim-qf'}
	qf_config()

	plug {'romainl/vim-cool'}
	plug {'junegunn/vim-peekaboo'}
	plug {'markonm/traces.vim'}
	plug {'machakann/vim-sandwich'}
	plug {'kana/vim-niceblock'}


	plug {'rbgrouleff/bclose.vim'}                         -- close buffer without closing windows
	plug {'tommcdo/vim-lion'}                              -- gl and gL align around a character (so glip=)
	plug {'justinmk/vim-gtfo'}                             -- got and gof open current file in terminal/file manager
	-- {'jeetsukumaran/vim-indentwise'})
	plug {'michaeljsmith/vim-indent-object'}               -- use indent level like ii or ai
	-- {'tpope/vim-sleuth'})

	plug {'numtostr/FTerm.nvim'}
	ftterm_config()


	plug {'nathom/filetype.nvim'}
	plug {'nvim-treesitter/nvim-treesitter'}
	treesitter_config()

	plug {'p00f/nvim-ts-rainbow'}
	plug {'nvim-lua/plenary.nvim'}
	plug {'lewis6991/gitsigns.nvim'}
	gitsigns_config()

	-- {'luukvbaal/nnn.nvim'})
	plug {'mcchrish/nnn.vim'}
	vim_nnn_config()


	plug {'tpope/vim-projectionist', opt=true}
	plug {'vimwiki/vimwiki'}
	vimwiki_config()

	plug {'folke/which-key.nvim'}
	plug {'L3MON4D3/LuaSnip'}

	plug {'neovim/nvim-lspconfig'}
	plug {'williamboman/nvim-lsp-installer'}
	lsp_config()

	plug {'onsails/lspkind-nvim'}
	plug {'ray-x/lsp_signature.nvim'}
	plug {'weilbith/nvim-code-action-menu'}
	plug {'hrsh7th/nvim-cmp'}
	require 'config/cmp_config'

	plug {'hrsh7th/cmp-nvim-lsp'}
	plug {'hrsh7th/cmp-path'}
	plug {'hrsh7th/cmp-buffer'}
	plug {'hrsh7th/cmp-nvim-lua'}
	plug {'saadparwaiz1/cmp_luasnip'}


	plug {'mtdl9/vim-log-highlighting'}
	plug {'othree/csscomplete.vim'}
	plug {'norcalli/nvim-colorizer.lua'}
	plug {'alvan/vim-closetag'}
	plug {'mattn/emmet-vim'}
	emmet_config()

	plug {'moll/vim-node'}
	plug {'pangloss/vim-javascript'}

	plug {'vim-ruby/vim-ruby'}
	plug {'elixir-editors/vim-elixir'}
	-- {'xolox/vim-misc'})
	-- {'xolox/vim-lua-ftplugin'})
	plug {'cespare/vim-toml'}
	-- {'fatih/vim-go'})
	plug {'mrk21/yaml-vim'}
	plug {'junegunn/goyo.vim'}                             -- distraction free vim
	plug {'junegunn/limelight.vim'}

	plug {'kyazdani42/nvim-web-devicons'}
	plug {'sainnhe/sonokai'}
	plug {'sainnhe/edge'}
	plug {'folke/tokyonight.nvim'}
	-- { 'mcchrish/zenbones.nvim'})
	plug {'wuelnerdotexe/vim-enfocado'}
	plug {'nvim-lualine/lualine.nvim'}
	lualine_config()


paq(plugins)


