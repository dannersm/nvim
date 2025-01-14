require('maximize').setup()

--maximize current window
vim.keymap.set('n', '<leader>z', require('maximize').toggle)
