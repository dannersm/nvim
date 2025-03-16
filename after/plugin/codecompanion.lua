local function preferred_model_picker(preferred)
    return function(self)
        if self == nil then
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
    'qwen2.5-coder:32b',
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
        end,
        anthropic_extended = function()
            return require("codecompanion.adapters").extend("anthropic", {
                schema = {
                    extended_thinking = true,
                    thinking_budget = 6000,
                    max_tokens = 10000,
                    temperature = 0.2
                },
                env = {
                    api_key = "cmd: cat ~/.keys/anthropic"
                }
            })
        end,
        anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
                schema = {
                    extended_thinking = false,
                    max_tokens = 5000,
                    temperature = 0
                },
                env = {
                    api_key = "cmd: cat ~/.keys/anthropic"
                }
            })
        end,
    },
    strategies = {
        chat = {
            adapter = "ollama",
            tools = {
                vectorcode = {
                    description = "Run VectorCode to retrieve the project context.",
                    callback = require("vectorcode.integrations").codecompanion.chat.make_tool(),
                }
            },
        },
        inline = {
            adapter = "ollama",
        },
    },
    display = {
        action_palette = {
            provider = "telescope",
            width = 100,
            height = 15,
            opts = {
                show_default_actions = true,
                show_default_prompt_library = true
            }
        },
        chat = {
            window = {
                position = "right",
                width = .4,
                height = .9,
            },
        },
        inline = {
            layout = "horizontal"
        }
    }
})

vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
