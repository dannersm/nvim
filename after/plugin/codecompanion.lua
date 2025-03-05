require("codecompanion").setup({
	adapters = {
		-- ollama model config
		qwen_7b = function()
			return require("codecompanion.adapters").extend("ollama", {
				name = "qwen_7b",
				formatted_name = "Qwen2.5 7B",
				env = {
					url = "http://localhost:11434",
				},
				url = "${url}/api/chat",
				schema = {
					model = {
						default = "qwen2.5-coder:7b"
					},
					num_ctx = {
						default = 32768
					},
					num_predict = {
						default = -1
					}
				}
			})
		end
	},
	strategies = {
		chat = {
			adapter = "qwen_7b",
		},
		inline = {
			adapter = "qwen_7b",
		},
	},
	display = {
		action_palette = {
			provider = "telescope",
			width = 100,
			height=15,
			opts = {
				show_default_actions = true,
				show_default_prompt_library = true
			}
		},
		chat = {
			window = {
				position = "right",
				width = .35,
			},
			start_in_insert_mode = true,
		},
		inline = {
			layout = "horizontal"
		}
	}
})

vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>ct", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanion<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
