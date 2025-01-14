-- leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--window splitting settings
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>sh", ":split<CR>")
vim.keymap.set("n", "<leader>sx", ":close<CR>")

--clear search
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

--tab management
vim.keymap.set("n", "<leader>to", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>")
vim.keymap.set("n", "<leader>tn", ":tabn<CR>")
vim.keymap.set("n", "<leader>tp", ":tabp<CR>")

--create vim session
vim.keymap.set("n", "<leader>ss", ":Obsess<CR>")

-- copy-pasting from and to system clipboard
vim.keymap.set('n', '<leader>y', '"+y', {noremap = true, silent=true})
vim.keymap.set('n', '<leader>yy', '"+yy', {noremap = true, silent=true})
vim.keymap.set('v', '<leader>y', '"+y', {noremap = true, silent=true})
vim.keymap.set('x', '<leader>y', '"+y', {noremap = true, silent=true})

vim.keymap.set('n', '<leader>p', '"+p', {noremap = true, silent=true})
vim.keymap.set('v', '<leader>p', '"+p', {noremap = true, silent=true})
vim.keymap.set('x', '<leader>p', '"+p', {noremap = true, silent=true})

-- make x cut and d not go to the clipboard
vim.keymap.set('n', '<leader>dd', '"_dd', {noremap = true, silent=true})
vim.keymap.set('v', '<leader>d', '"_d', {noremap = true, silent=true})
vim.keymap.set('x', '<leader>d', '"_d', {noremap = true, silent=true})
vim.keymap.set('n', '<leader>dd', '"_dd', {noremap = true, silent=true})
