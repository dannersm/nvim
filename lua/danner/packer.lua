-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })

    use({ 'nvim-telescope/telescope-ui-select.nvim' })

    -- colorscheme catppuccin ftw
    use { "catppuccin/nvim", as = "catppuccin" }

    -- syntax highlighting
    use("nvim-treesitter/nvim-treesitter", { run = ':TSUpdate' })

    -- filetree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    -- why not?
    use("theprimeagen/harpoon")

    -- maximization
    use {
        'declancm/maximize.nvim',
    }
    -- status bar
    use {
        'nvim-lualine/lualine.nvim',
    }

    -- configure snippets
    use {
        "L3MON4D3/LuaSnip",
    }


    use { "rafamadriz/friendly-snippets" }


    -- lsp management
    use({
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

    -- formatter
    use {
        "stevearc/conform.nvim"
    }

    -- autopairs
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
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

    -- molten
    use({
        "benlubas/molten-nvim",
        tag = "v1.*",             -- equivalent to version "^1.0.0"
        run = ":UpdateRemotePlugins", -- equivalent to build
    })

    -- codecompanion for llm
    use({
        "olimorris/codecompanion.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        }
    })

    -- markdown renderer
    use({
        'MeanderingProgrammer/render-markdown.nvim',
        after = { 'nvim-treesitter' },
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
        config = function()
        end,
    })

    if packer_bootstrap then
        require('packer').sync()
    end
end)
