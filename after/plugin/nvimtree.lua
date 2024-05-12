require("nvim-tree").setup()

vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>")

vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
