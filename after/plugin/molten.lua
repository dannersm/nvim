vim.g.molten_auto_image_output = true
vim.g.molten_enter_output_behavior = "open_and_enter"
vim.g.molten_virt_text_max_lines = 30
vim.g.molten_wrap_output = true

vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv",
    { silent = true, desc = "evaluate visual selection" })
vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>",
    { silent = true, desc = "evaluate line" })
vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>",
    { silent = true, desc = "re-evaluate cell" })
vim.keymap.set("n", "<localleader>rd", ":MoltenDelete<CR>",
    { silent = true, desc = "molten delete cell" })

vim.keymap.set("n", "<localleader>ho", ":MoltenHideOutput<CR>",
    { silent = true, desc = "hide output" })
vim.keymap.set("n", "<localleader>eo", ":noautocmd MoltenEnterOutput<CR>",
    { silent = true, desc = "show/enter output" })


vim.keymap.set("n", "<localleader>mr", ":MoltenRestart<CR>",
    { silent = true, desc = "restart the kernel" })
