-- leader to space
vim.g.mapleader = " "

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


