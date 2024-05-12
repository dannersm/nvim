local cat = require("catppuccin")
cat.setup({
	transparent_background = true,
	flavour = "moccha"
})
-- transparent background
vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
