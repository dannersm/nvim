-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- setup virtual env for molten
vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")


require("config.opts")
require("config.lazy")
require("config.lsp")
require("config.treesitter-configs")
require("config.appearance")
require("config.remaps")
