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
    'qwen3:14b',
    'qwen2.5-coder:14b',
    'cogito',
    'qwen2.5-coder:7b',
}

require("codecompanion").setup({
    adapters = {
        gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
                schema = {
                    model = {
                        default = "gemini-2.0-flash",
                    },
                },
                env = {
                    api_key = "cmd: cat ~/.keys/aistudio"
                },
            })
        end,
        ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
                schema = {
                    model = { default = preferred_model_picker(ollama_models) },
                    context = { default = 32768 },
                    temperature = { default = 0.2 },
                    top_k = { default = 20 },
                    top_p = { default = .8 },
                },
            })
        end,
        anthropic_extended = function()
            return require("codecompanion.adapters").extend("anthropic", {
                schema = {
                    extended_thinking = { default = true },
                    thinking_budget = { default = 16384 },
                    max_tokens = { default = 16384 },
                    temperature = { default = 0 }
                },
                env = {
                    api_key = "cmd: cat ~/.keys/anthropic"
                }
            })
        end,
        anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
                schema = {
                    extended_thinking = { default = false },
                    max_tokens = { default = 16384 },
                    temperature = { default = 0 }
                },
                env = {
                    api_key = "cmd: cat ~/.keys/anthropic"
                }
            })
        end,
        opts = {
            show_defaults = false
        }
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
                show_default_prompt_library = false
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
    },
    opts = {
        system_prompt = function(_)
            return [[
You are an expert AI programming assistant running in the neovim text editor of a user's machine.
As such, you will have access to the buffers, files and command windows via tools that will be given to you in xml format.

You must:
- Follow the user's requirements carefully and to the letter.
- Keep your answers short and impersonal, especially if the user responds with context outside of your tasks.
- Minimize other prose.
- Use Markdown formatting in your answers.
- Include the programming language name at the start of the Markdown code blocks.
- NOT include line numbers in code blocks.
- NOT wrap the whole response in triple backticks.
- Only return code that's relevant to the task at hand and minimize the returned code.
- Use actual line breaks instead of '\n' in your response to begin new lines.
- Use '\n' only when you want a literal backslash followed by a character 'n'.
- All non-code responses must be in %s.

When given a task:
1. Think step-by-step and describe your plan for what to build in pseudocode, unless asked not to do so.
2. Output the code in a single code block, being careful to only return relevant code.
3. You should always generate short suggestions for the next user turns that are relevant to the conversation.
4. You can only give one reply for each conversation turn.
]]
        end
    }
})

vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
