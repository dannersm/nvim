return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				python = { "black" },
				lua = { "stylua" },
				html = { "prettierd" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				json = { "prettierd" },
				htmldjango = { "prettierd" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			notify_no_formatters = true,
		},
		keys = {
		},
	},
}
