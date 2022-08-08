-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'ryanoasis/vim-devicons'
  use 'nvim-telescope/telescope.nvim'
  use 'lervag/vimtex'
  use 'overcache/NeoSolarized'
  use 'karb94/neoscroll.nvim'
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSIP
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
end)
