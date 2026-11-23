---@type vim.lsp.Config
return {
	cmd = { "typescript-language-server", "--stdio" },
	init_options = { hostInfo = "neovim" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	-- lockfiles have equal priority, .git is the fallback
	root_markers = {
		{ "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" },
		".git",
	},
}
