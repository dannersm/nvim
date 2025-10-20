vim.lsp.enable({ "pyright", "lua_ls" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
			vim.keymap.set("i", "<Tab>", "<C-y>", {})
			vim.keymap.set("i", "<C-Space>", vim.lsp.completion.get, {})
		end

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	end,
})

vim.api.nvim_create_autocmd("InsertCharPre", { callback = vim.lsp.completion.get })

vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = {
		current_line = true,
	},
})

