-- This file can be loaded by calling `lua require('plugins')` from your init.vim
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

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- fuzzy finder
	use ({
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		requires = { {'nvim-lua/plenary.nvim'} }
	})

	-- colorscheme catpuccin ftw
	use ({"catppuccin/nvim", config = function()
		vim.cmd("colorscheme catppuccin-mocha")
	end})

	-- syntax highlighting
	use ("nvim-treesitter/nvim-treesitter", {run = ':TSUpdate'})

	-- filetree 
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
	}

	-- why not?
	use ("theprimeagen/harpoon")

	-- status bar
	use {
	  'nvim-lualine/lualine.nvim',
	}

	-- configure snippets
	use {'rafamadriz/friendly-snippets'}
	use {

		"L3MON4D3/LuaSnip",
		requires = { "rafamadriz/friendly-snippets" },
	}


	-- lsp management
	use ({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	-- completion engine
	use {
        "hrsh7th/nvim-cmp",
        requires = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
        }
    }

	-- autopairs
	use {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup {}
		end
	}

	-- surrouder
	use {
 		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	}

	-- integration with tmux and better navigation
	use {
		"christoomey/vim-tmux-navigator",
	}

	-- integration with tmux and better navigation
	use {
		"tpope/vim-obsession",
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
