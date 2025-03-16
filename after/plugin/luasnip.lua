local ls = require 'luasnip'
require("luasnip.loaders.from_vscode").lazy_load()
ls.setup {}
ls.filetype_extend("javascript", {"javascriptreact", "html"})



