require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {"lua_ls", "pyright", "emmet_ls", "tailwindcss", "black"}
})

-- on attach func
local on_attach = function(client, bufnr)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end
local lsp = require("lspconfig")
lsp.lua_ls.setup{on_attach = on_attach}
lsp.pyright.setup({on_attach=on_attach})
lsp.emmet_ls.setup({})
lsp.tailwindcss.setup({on_attach=on_attach})
