vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- disable netrw (nvim-tree replaces it)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- python provider for molten
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")

require("config.opts")
require("config.plugins")
require("config.treesitter")
require("config.lsp")
require("config.remaps")
