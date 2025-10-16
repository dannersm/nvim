vim.lsp.enable({"pyright", "lua_ls"})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			local chars = {}
			for i = 32, 126 do
				table.insert(chars, string.char(i))
			end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set("i", "<Tab>", "<C-y>", {})
		vim.keymap.set("i", "<C-Space>", vim.lsp.completion.get, {})
	end,
})

vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = {
		current_line = true,
	},
})
