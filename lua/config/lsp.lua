vim.lsp.enable("pyright")
vim.lsp.enable("lua_ls")

local function tab_complete()
	if vim.fn.pumvisible() == 1 then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n", true)
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", true)
	end
end

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
		vim.keymap.set("i", "<Tab>", tab_complete, {})
		vim.keymap.set("i", "<C-Space>", vim.lsp.completion.get, {})
	end,
})

vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = {
		current_line = true,
	},
})
