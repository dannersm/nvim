-- Native plugin manager (:h vim.pack). Update with :lua vim.pack.update()

-- Build hooks; must be defined before vim.pack.add() to run on install.
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if kind == "delete" then
			return
		end
		vim.schedule(function()
			if name == "molten-nvim" then
				vim.cmd.UpdateRemotePlugins()
			elseif name == "nvim-treesitter" and kind == "update" then
				vim.cmd.TSUpdate()
			end
		end)
	end,
})

local gh = function(repo)
	return "https://github.com/" .. repo
end

vim.pack.add({
	{ src = gh("catppuccin/nvim"), name = "catppuccin" },
	gh("nvim-tree/nvim-web-devicons"),
	gh("nvim-lualine/lualine.nvim"),
	gh("windwp/nvim-autopairs"),
	gh("nvim-treesitter/nvim-treesitter"), -- `main` branch (default)
	gh("mason-org/mason.nvim"),
	gh("stevearc/conform.nvim"),
	gh("nvim-lua/plenary.nvim"),
	{ src = gh("nvim-telescope/telescope.nvim"), version = vim.version.range("0.2") },
	gh("nvim-tree/nvim-tree.lua"),
	gh("christoomey/vim-tmux-navigator"),
	gh("tpope/vim-obsession"),
	gh("MeanderingProgrammer/render-markdown.nvim"),
	gh("benlubas/molten-nvim"),
})

require("catppuccin").setup({ flavour = "mocha", transparent_background = true })
vim.cmd.colorscheme("catppuccin")

require("lualine").setup()
require("nvim-autopairs").setup()
require("mason").setup() -- also puts mason's bin/ on PATH for the LSP servers
require("nvim-tree").setup()
require("render-markdown").setup()

require("conform").setup({
	formatters_by_ft = {
		python = { "black" },
		lua = { "stylua" },
		html = { "prettierd" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		json = { "prettierd" },
		htmldjango = { "prettierd" },
	},
	default_format_opts = { lsp_format = "fallback" },
})

-- molten
vim.g.molten_use_border_highlights = true
vim.g.molten_auto_open_html_in_browser = true
