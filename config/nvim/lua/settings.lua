local g = vim.g
local set = vim.opt

-- don't load these built-in plugins
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
-- g.loaded_matchit = 1

g.mapleader = ' '
g.vimsyn_embeded = 'lr'

vim.cmd('filetype plugin on')


set.backup = false
set.swapfile = false
set.autoread = true
set.autowrite = true
set.gdefault = true
set.hidden = true
set.hlsearch = true
set.incsearch = true
set.lazyredraw = true
set.linebreak = true
set.wrap = false
set.number = true
set.relativenumber = false
set.cursorcolumn = true
set.cursorline = true
set.ruler = true
set.splitbelow = true
set.splitright = true
set.ignorecase = true
set.smartcase = true
set.signcolumn = 'yes'
set.colorcolumn = {80}
set.scrolloff = 8
set.laststatus = 2
set.mouse = 'a'
set.shortmess = 'at'
set.expandtab = false
set.shiftround = true
set.smarttab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.thesaurus:append('$DOTFILES/vetc/thesaurii.txt')
set.clipboard = 'unnamed'
set.completeopt = { 'menu', 'preview' }
set.list = false
set.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "·"
}
set.undofile = true
set.undodir = '$HOME/.config/nvim/.vimundo'
set.grepprg = 'rg --smart-case --vimgrep'
set.grepformat = '%f:%l:%c:%m'
set.omnifunc = 'syntaxcomplete#Complete'

set.termguicolors = true
set.background = 'dark'
