require('maximize').setup()

--maximize current window
vim.keymap.set('n', '<Leader>z', require('maximize').toggle)
