vim.o.number = true
vim.o.tabstop = 2
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.wrap = true
vim.o.ignorecase = true -- needed for smartcase to do anything
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.scrolloff = 20
-- noselect: nothing is auto-selected, so <CR> is always a newline and docs are
-- only fetched for the item you actually highlight. Prefix matching (no
-- "fuzzy") keeps the ranking from lsp.lua: in-scope names before auto-imports.
vim.o.completeopt = "menuone,noselect,popup"
vim.o.pumheight = 10 -- show at most 10 items; best matches are sorted first
