local conf = require("conform")
conf.setup({
    formatters_by_ft = {
        python = { formatter = "black" },
		html = { "prettierd" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		json = { "prettierd" },
		htmldjango = { "prettierd" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
	notify_no_formatters = true
})

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
    require("conform").format({})
end, { desc = "Format file or range (in visual mode)" })
