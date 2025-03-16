require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {"lua_ls", "pyright", "emmet_language_server", "tailwindcss", "ts_ls"}
})

-- on attach func
local on_attach = function(client, bufnr)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end
local lsp = require("lspconfig")
lsp.lua_ls.setup{on_attach = on_attach}
lsp.pyright.setup({on_attach=on_attach})
lsp.emmet_language_server.setup({
    filetypes = { "css", "html", "htmldjango", "javascriptreact",  "javascript" }
})
lsp.ts_ls.setup({on_attach=on_attach, capabilities=vim.lsp.protocol.make_client_capabilities() })
lsp.tailwindcss.setup({on_attach=on_attach})
