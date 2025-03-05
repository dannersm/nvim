local conf = require("conform")
conf.setup({
    formatters_by_ft = {
        javascript = { formatter = "prettierd" },
        typescript = { formatter = "prettierd" },
        javascriptreact = { formatter = "prettierd" },
        typescriptreact = { formatter = "prettierd" },
        json = { formatter = "prettierd" },
        graphql = { formatter = "prettierd" },
        markdown = { formatter = "prettierd" },
        python = { formatter = "black" },
        css = { formatter = "prettierd" },
        scss = { formatter = "prettierd" },
        htmldjango = { formatter = "prettierd" }
    },
    default_format_opts = {
        lsp_format = "last",
    },
})

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
    require("conform").format({
        stop_after_first = true,
    })
end, { desc = "Format file or range (in visual mode)" })
