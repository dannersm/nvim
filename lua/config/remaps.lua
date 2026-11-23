local map = vim.keymap.set

-- window splitting
map("n", "<leader>sv", "<cmd>vsplit<CR>")
map("n", "<leader>sh", "<cmd>split<CR>")

-- clear search
map("n", "<leader>nh", "<cmd>nohl<CR>")

-- vim session
map("n", "<leader>ss", "<cmd>Obsess<CR>")

-- system clipboard
map({ "n", "x" }, "<leader>y", '"+y')
map("n", "<leader>yy", '"+yy')
map({ "n", "x" }, "<leader>p", '"+p')

-- delete without yanking
map("n", "<leader>dd", '"_dd')
map({ "n", "x" }, "<leader>d", '"_d')

-- format
map({ "n", "x" }, "<leader>cf", function() require("conform").format() end)

-- telescope
map("n", "<leader>ff", function() require("telescope.builtin").find_files() end)
map("n", "<leader>lg", function() require("telescope.builtin").live_grep() end)

-- nvim-tree
map({ "n", "x" }, "<leader>tt", "<cmd>NvimTreeToggle<CR>")
map({ "n", "x" }, "<leader>tf", "<cmd>NvimTreeFocus<CR>")

-- molten
map("n", "<leader>mi", "<cmd>MoltenInit<CR>")
map("n", "<leader>rr", "<cmd>MoltenReevaluateCell<CR>")
map("x", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv")
map("n", "<leader>rl", "<cmd>MoltenEvaluateLine<CR>")
map("n", "<leader>eo", "<cmd>noautocmd MoltenEnterOutput<CR>")
