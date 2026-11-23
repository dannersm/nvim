---@type vim.lsp.Config
return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".stylua.toml", "stylua.toml", ".git" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			-- know the vim.* API (only the runtime, not every plugin: that's what gets slow)
			workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
		},
	},
}
