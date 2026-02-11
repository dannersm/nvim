return {
  {
    "benlubas/molten-nvim",
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_use_border_highlights = true
      vim.g.molten_auto_open_html_in_browser = true
      vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>")
      vim.keymap.set("n", "<leader>rr", ":MoltenReevaluateCell<CR>")
      vim.keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv")
      vim.keymap.set("n", "<leader>rl", ":MoltenEvaluateLine<CR>")
      vim.keymap.set("n", "<leader>eo", ":noautocmd MoltenEnterOutput<CR>")
    end,
  },
}
