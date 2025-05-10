--------------------------------------------------------------
--					 lua/core/plug.lua
--------------------------------------------------------------

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Manage packer itself
	use 'wbthomason/packer.nvim'

	-- Color theme 
	use "ellisonleao/gruvbox.nvim"
	use { "catppuccin/nvim", as = "catppuccin" }

	-- Bufferline (file tabs)
	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

	-- File tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
	}

	-- Nice looking status bar
	use {
		'nvim-lualine/lualine.nvim',
		 requires = {
			 'kyazdani42/nvim-web-devicons',
			 opt = true
		 }
	 }

	-- LSP
	use {"neovim/nvim-lspconfig"}

	-- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Code completion
	use {'neoclide/coc.nvim', branch = 'release'}

	-- Syntax hightlighting
	use {'MaxMEllon/vim-jsx-pretty'}
	use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

	if packer_bootstrap then
    	require('packer').sync()
  	end
end)
