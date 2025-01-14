vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")

require("danner.remap")
require("danner.set")
require("danner.packer")
