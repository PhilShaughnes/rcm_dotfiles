vim.cmd('packadd packer.nvim')

return require('packer').startup(
  function()
    use {'wbthomason/packer.nvim', opt = true}

    use '/usr/local/opt/fzf'
    use 'junegunn/fzf.vim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'

    use 'romainl/vim-cool'
    use 'junegunn/vim-peekaboo'
    use 'markonm/traces.vim'
    use 'machakann/vim-sandwich'
    use 'tpope/vim-endwise'
    use 'kana/vim-niceblock'
    use 'romainl/vim-qf'

    use { 'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config = function()
        local l = require('lualine')
        l.theme = 'dracula'
        l.status()
      end
    }
  end
)
