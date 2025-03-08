local function preferred_model_picker(preferred)
  return function(self)
    if self == nil then
      -- Debug:render() calls Adapter.schema.model.default() but doesn't pass
      -- in `self`. Just return an empty string in this case.
      return ''
    end

    local choices = self.schema.model.choices(self)

    for _, best in ipairs(preferred) do
      for _, choice in ipairs(choices) do
        if choice:find(best, 1, true) then
          return choice
        end
      end
    end

    return choices[1]
  end
end

local ollama_models = {
                'qwen2.5-coder:14b',
                'qwen2.5-coder:7b',
                'qwen2.5-coder:3b',
                'qwen2.5-coder:1.5b',
                'qwen2.5-coder:0.5b',
              }

require("codecompanion").setup({
	adapters = {
ollama = function()
      return require("codecompanion.adapters").extend("ollama", {
        schema = {
          model = {
            default = preferred_model_picker(ollama_models),
          },
        },
      })
    end,	},
	strategies = {
		chat = {
			adapter = "ollama",
		},
		inline = {
			adapter = "ollama",
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

