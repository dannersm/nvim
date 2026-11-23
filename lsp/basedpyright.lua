---@type vim.lsp.Config
return {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	},
	settings = {
		basedpyright = {
			analysis = {
				-- basedpyright defaults to "recommended", which is very noisy
				typeCheckingMode = "standard",
				diagnosticMode = "openFilesOnly",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
}
