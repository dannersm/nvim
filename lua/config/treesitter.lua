-- nvim-treesitter (main branch) only installs parsers/queries.
-- Highlighting itself is native: vim.treesitter.start().
local ts = require("nvim-treesitter")

ts.install({ "python", "javascript", "typescript", "html", "css", "sql", "htmldjango", "json", "bash" })

vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)
		if not lang then
			return
		end
		if vim.treesitter.language.add(lang) then
			vim.treesitter.start(ev.buf, lang)
		elseif require("nvim-treesitter.parsers")[lang] then
			-- auto-install missing parsers, then start highlighting
			ts.install(lang):await(function()
				if vim.api.nvim_buf_is_valid(ev.buf) and vim.treesitter.language.add(lang) then
					vim.treesitter.start(ev.buf, lang)
				end
			end)
		end
	end,
})
