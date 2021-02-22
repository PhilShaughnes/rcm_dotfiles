git clone https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/opt/paq-nvim

local execute = vim.api.nvim_command
local fn = vim.fn
local packer = {
  clone_cmd = '!git clone https://github.com/wbthomason/packer.nvim ',
  install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
}
local paq = {
  clone_cmd = '!git clone https://github.com/savq/paq-nvim.git ',
  install_path = fn.stdpath('data')..'/site/pack/paqs/opt/paq-nvim'
}

-- local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(packer.install_path)) > 0 then
  execute(packer.clone_cmd..install_path)
  execute 'packadd packer.nvim'
end

if fn.empty(fn.glob(paq.install_path)) > 0 then
  execute(paq.clone_cmd..install_path)
  -- execute 'packadd paq-nvim'
end

