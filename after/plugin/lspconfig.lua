require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {"lua_ls", "pyright"},
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
--[[
lsp.pylsp.setup{
	on_attach = on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
        pylsp = {
            plugins = {
                jedi_completion = {
                    include_params = true,
                },
				jedi_signature_help = {
					enabled = true
				},
				pycodestyle={
					enabled=true,
					ignore = {'E501', 'E321', 'E266'},
					maxLineLength=120
				}
            },
        },
    },
}
--]]
lsp.pyright.setup({on_attach=on_attach, capabilities=require("cmp_nvim_lsp").default_capabilities() })
