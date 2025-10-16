return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = { flavour = "mocha" } },
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
}
