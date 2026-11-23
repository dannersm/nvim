-- Server configs live in lsp/<name>.lua
vim.lsp.enable({ "basedpyright", "lua_ls", "ts_ls" })

-- Auto-import suggestions (names not yet in scope): basedpyright / ts_ls
local function is_auto_import(item)
	return item.detail == "Auto-import"
		or vim.tbl_get(item, "data", "autoImportText") ~= nil
		or vim.tbl_get(item, "data", "entryNames", 1, "source") ~= nil
end

-- Names already in scope before auto-imports; within each group the server's
-- own ranking (fuzzy score only applies if 'completeopt' has "fuzzy").
local function sort_items(a, b)
	local ia, ib = a.user_data.nvim.lsp.completion_item, b.user_data.nvim.lsp.completion_item
	local aa, ab = is_auto_import(ia), is_auto_import(ib)
	if aa ~= ab then
		return ab
	end
	local sa, sb = a._fuzzy_score or 0, b._fuzzy_score or 0
	if sa ~= sb then
		return sa > sb
	end
	return (ia.sortText or ia.label) < (ib.sortText or ib.label)
end

-- Ask the server ONCE per word (on its first letter, or after "." etc.), then
-- let nvim filter that list locally as you keep typing: instant, no waiting on
-- the server. (Built-in autotrigger re-requests on every key for servers that
-- mark results "incomplete", so you only see results after pausing.)
local function on_char(buf)
	local char = vim.v.char
	local col = vim.fn.col(".") - 1
	local prev = vim.api.nvim_get_current_line():sub(col, col)
	local word_start = char:match("[%a_]") and not prev:match("[%w_]")
	local trigger = false
	if not word_start then
		for _, c in ipairs(vim.lsp.get_clients({ bufnr = buf, method = "textDocument/completion" })) do
			if vim.list_contains(c.server_capabilities.completionProvider.triggerCharacters or {}, char) then
				trigger = true
				break
			end
		end
	end
	if word_start or trigger then
		vim.schedule(vim.lsp.completion.get)
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { cmp = sort_items })
			vim.keymap.set("i", "<C-Space>", vim.lsp.completion.get, { buffer = ev.buf })
			-- one trigger autocmd per buffer, even with several servers attached
			local group = vim.api.nvim_create_augroup("lsp_complete_" .. ev.buf, { clear = true })
			vim.api.nvim_create_autocmd("InsertCharPre", {
				group = group,
				buffer = ev.buf,
				callback = function()
					on_char(ev.buf)
				end,
			})
		end

		-- 0.12 defaults also exist: K hover, grn rename, gra code action,
		-- grr references, gri implementation, gO symbols, <C-s> signature help
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf })
	end,
})

-- <Tab>: accept selected item (or the first one) when the menu is open
vim.keymap.set("i", "<Tab>", function()
	if vim.fn.pumvisible() == 0 then
		return "<Tab>"
	end
	return vim.fn.complete_info({ "selected" }).selected == -1 and "<C-n><C-y>" or "<C-y>"
end, { expr = true })

vim.diagnostic.config({ virtual_text = { current_line = true } })
