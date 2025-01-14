local conf = require("conform")
conf.setup({
	formatters_by_ft = {
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
		json = { { "prettierd", "prettier" } },
		graphql = { { "prettierd", "prettier" } },
		markdown = { { "prettierd", "prettier" } },
		python = {{"black"}},
		css = { { "prettierd", "prettier" } },
		scss = { { "prettierd", "prettier" } },
	},
})
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	conf.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })
