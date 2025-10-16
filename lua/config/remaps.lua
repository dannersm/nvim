-- leader to space
vim.g.mapleader = " "

--window splitting settings
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>sh", ":split<CR>")

--clear search
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

--create vim session
vim.keymap.set("n", "<leader>ss", ":Obsess<CR>")

-- copy-pasting from and to system clipboard
vim.keymap.set({"n", "v", "x"}, '<leader>y', '"+y', {noremap = true, silent=true})
vim.keymap.set('n', '<leader>yy', '"+yy', {noremap = true, silent=true})

vim.keymap.set({"n", "v", "x"}, '<leader>p', '"+p', {noremap = true, silent=true})

-- make x cut and d not go to the clipboard
vim.keymap.set('n', '<leader>dd', '"_dd', {noremap = true, silent=true})
vim.keymap.set({"n", "v", "x"}, '<leader>d', '"_d', {noremap = true, silent=true})
vim.keymap.set({"n", "v"}, '<leader>cf', require("conform").format)

