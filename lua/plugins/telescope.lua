return {
	{ "nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{"<leader>ff", require("telescope.builtin").find_files},
		{"<leader>lg", require("telescope.builtin").live_grep}
	}
	},
	{{'nvim-telescope/telescope-ui-select.nvim' }},
}
